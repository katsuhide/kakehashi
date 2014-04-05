require 'twitter'
require_relative '../assets/twitter/twitter_api_util'

def read_configuration
	@config = Hash.new()
	@config['fetch_size'] = 100
	@config['twitter_oauth_count'] = ENV['CONSUMER_KEY'].split(',').count
	@config['consumer_keys'] = ENV['CONSUMER_KEY'].split(',')
	@config['consumer_secrets'] = ENV['CONSUMER_SECRET'].split(',')
	@config['access_tokens'] = ENV['ACCESS_TOKEN'].split(',')
	@config['access_token_secrets'] = ENV['ACCESS_TOKEN_SECRET'].split(',')
	return @config
end

def initalize_twitter
	@config = read_configuration
	@logger = Logger.new('log/twitter.log')
	@logger.level = Logger::INFO
	@tw = TwitterUtil.new(@logger, @config)
	@fetch_size = @config["fetch_size"]
	@execute_datetime = Time.now()
end

def get_search_keyword(keyword)
	tag_type = keyword['tag_type']
	prefix = nil
	case tag_type
	when "sake" then
		prefix = "酒 "
	else
		prefix = ""
	end
	return prefix + keyword['search_word']
end

def get_keywords
	keywords = Keyword.all
	return keywords
end

def create_trend_result(keyword, tweets)
	trend = Trend.new()
	trend['keyword_id'] = keyword['id']
	trend['count'] = tweets.size
	trend['search_datetime'] = @execute_datetime
	trend.save
end

def update_keyword(keyword, tweets)
	latest_tweet = tweets[tweets.size - 1]
	if !tweets.nil? && !latest_tweet.nil? then
		keyword['since_id'] = latest_tweet['id']
		keyword.save
	end
end

## 	construct result
def contruct_result(tweets)
	result = []
	tweets.each{|tweet|
		h = Hash::new
		h.store("id", tweet.id)
		h.store("time", tweet.created_at)
		result.push(h)
	}
	return result
end

## 	search tweets method
def search_tweets(keyword, since_id)
	tweets = @tw.search_tweets(@fetch_size, keyword, since_id)
	return contruct_result(tweets)
end

## 	search tweets method by since_id and max_id
def search_tweets_by_both(keyword, since_id, max_id)
	tweets  = @tw.search_tweets_by_both(@fetch_size, keyword, since_id, max_id)
	return contruct_result(tweets)
end

## 	再帰検索
def repeat_back_search(keyword, since_id, min_id, base_tweets)
	tweets = search_tweets_by_both(keyword, since_id, min_id-1)
	min_id = @tw.get_min_id(tweets)
	base_tweets += tweets
	if tweets.count != 0 then
		@logger.info("Count:" + tweets.size.to_s + ", Min_id: " + min_id.to_s + ", Max_id: " + @tw.get_max_id(tweets).to_s)
		base_tweets = repeat_back_search(keyword, since_id, min_id, base_tweets)
	end
	return base_tweets
end

## 	since_id以降のTweetを全件取得する
def search_all_tweets(keyword, since_id)
	## 直近のTweetを取得
	@logger.info("Start getting the latest tweets.")
	tweets = search_tweets(keyword, since_id)
	@logger.info("Count:" + tweets.size.to_s + ", Min_id: " + @tw.get_min_id(tweets).to_s + ", Max_id: " + @tw.get_max_id(tweets).to_s)

	## そこから前回取得結果まで遡る
	if tweets.count != 0 then
		@logger.info("Start getting the other tweets")
		min_id = @tw.get_min_id(tweets)
		tweets = repeat_back_search(keyword, since_id, min_id, tweets)
	end
	return tweets
end


def execute_search_tweet(keywords)
	keywords.each{|keyword|
		search_word = get_search_keyword(keyword)
		since_id = keyword['since_id'].nil? ? 0 : keyword['since_id']
		tweets = nil

		begin
			# search all tweets
			@logger.info("START!!!" + "keyword: " + search_word + ", since_id: " + since_id.to_s)
			tweets = search_all_tweets(search_word, since_id).sort_by{|tweet| tweet['id']}

			# create the trend result
			create_trend_result(keyword, tweets)

		rescue Twitter::Error::TooManyRequests => tw_error
			@logger.error(tw_error.to_s + " during searching " + search_word)
			@tw.change_client
		rescue => ex
			@logger.error(ex)
		ensure
			@logger.info("END!!!" + "keyword: " + search_word + ".")
			# update keyword data
			if !tweets.nil? then
				update_keyword(keyword, tweets)
			end
		end
	}
end

# count tweets per hour
def count_tweets
	# initalize_twitter
	initalize_twitter

	# get the keyword list
	keywords = get_keywords

	# execute process each keyword
	execute_search_tweet(keywords)

end

# update the trendlist of day
def update_trendlist
	# keywordと結合して、tweetの件数を取得する
	trends = Trend.joins(:keyword).group(:keyword_id).sum(:count)

	# Update Day Trend
	trends.each do |trend|
		# 集計結果
		keyword_id = trend[0]
		total_count = trend[1]

		# keyword info
		keyword = Keyword.find_by(id:keyword_id)

		# trend info
		today = Date.today()
		keyword_id = keyword['id']
		day_trend = DayTrend.where(base_date:today).find_by(keyword_id:keyword_id)
		if day_trend.nil? then
			day_trend = DayTrend.new()
			day_trend['keyword_id'] = keyword['id']
			day_trend['total_count'] = total_count
			day_trend['base_date'] = today
			day_trend.save
		else
			day_trend['total_count'] = total_count
			day_trend.save
		end
	end
end

# update keyword by latest since_id
def update_keyword_to_latest
	# initalize_twitter
	initalize_twitter

	# get the keyword list
	keywords = get_keywords

	keywords.each do |keyword|
		tweet = @tw.search_tweet(get_search_keyword(keyword))
		new_since_id = tweet.nil? ? keyword['since_id'] : tweet['id']
		keyword['since_id'] = new_since_id
		keyword.save
	end

end

# update ranking
def update_ranking
	today = Date.today()
	rank = 1
	DayTrend.where(base_date:today).order("total_count").reverse_order.each do |trend|
		trend['rank'] = rank
		rank += 1
		trend.save
	end

end

namespace :twitter do
	desc 'test'
	task :test => :environment do
		initalize_twitter
		@client = @tw.get_client
		keyword = "酒 南"
		tweets = @client.search(keyword, :count => 2, :result_type => "recent", :since_id => 0).take(2)
		tweets.each do |tweet|
			pp tweet['text']
		end
	end

	desc 'count tweets and udpate the trendlist'
	task :all => :environment do
		count_tweets
		update_trendlist
		update_ranking
	end

	desc 'count tweets per hour'
	task :count_tweets => :environment do
		count_tweets
	end

	desc 'update the trendlist of day'
	task :update_trendlist => :environment do
		update_trendlist
	end

	desc 'update keyword by latest since_id'
	task :update_keyword => :environment do
		update_keyword_to_latest
	end

	desc 'update ranking'
	task :update_ranking => :environment do
		update_ranking
	end

end
