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

def get_keywords
	keywords = SearchCondition.all
	return keywords
end

def create_trend_result(keyword, tweets)
	trend = Trend.new()
	trend['keyword_id'] = keyword['id']
	trend['count'] = tweets.size
	trend['search_datetime'] = @execute_datetime
	trend.save
end

def update_keyword(search_condition, tweets)
	latest_tweet = tweets[tweets.size - 1]
	if !tweets.nil? && !latest_tweet.nil? then
		search_condition['since_id'] = latest_tweet['id']
		search_condition.save
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


def execute_search_tweet(search_conditions)
	search_conditions.each{|search_condition|
		search_word = search_condition['search_word']
		since_id = search_condition['since_id'].nil? ? 0 : search_condition['since_id']
		tweets = nil

		begin
			# search all tweets
			@logger.info("START!!!" + "search_condition: " + search_word + ", since_id: " + since_id.to_s)
			tweets = search_all_tweets(search_word, since_id).sort_by{|tweet| tweet['id']}

			# create the trend result
			create_trend_result(search_condition, tweets)

		rescue Twitter::Error::TooManyRequests => tw_error
			@logger.error(tw_error.to_s + " during searching " + search_word)
			@tw.change_client
		rescue => ex
			@logger.error(ex)
		ensure
			@logger.info("END!!!" + "search_condition: " + search_word + ".")
			# update search_condition data
			if !tweets.nil? then
				update_keyword(search_condition, tweets)
			end
		end
	}
end

# count tweets per hour
def count_tweets
	# initalize_twitter
	initalize_twitter

	# get the keyword list
	search_conditions = get_keywords

	# execute process each keyword
	execute_search_tweet(search_conditions)

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

		# DayTrendレコードを探す
		day_trend = DayTrend.where(keyword_id:keyword_id).order("base_date DESC").take(1).pop

		# 結果を更新する
		today = Date.today()
		if day_trend.nil? then
			# 新規レコードの作成
			day_trend = DayTrend.new()
			day_trend['keyword_id'] = keyword_id
			day_trend['total_count'] = total_count
			day_trend['base_date'] = today
		else
			# 既存レコードの更新
			day_trend['total_count'] += total_count		# 前回値の足し合わせる
			day_trend['base_date'] = today	# 当日以外の可能性があるため更新
		end
		day_trend.save
	end
end

# update keyword by latest since_id
def update_keyword_to_latest
	# initalize_twitter
	initalize_twitter

	# get the keyword list
	search_conditions = get_keywords

	search_conditions.each do |search_condition|
		tweet = @tw.search_tweet(search_condition['search_word'])
		new_since_id = tweet.nil? ? search_condition['since_id'] : tweet['id']
		search_condition['since_id'] = new_since_id
		search_condition.save
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

# clear trend table
def clear_trend_table
	# Trendテーブルを全件削除する
	Trend.delete_all

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
		clear_trend_table
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

	desc 'cleate trend table'
	task :clear_trend_table => :environment do
		clear_trend_table
	end

end
