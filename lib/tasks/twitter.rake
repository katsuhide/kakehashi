require 'twitter'
require 'yaml'	# TODO:configの用意
require '../assets/twitter/twitter_api_util.rb'

def read_configuration
	return YAML.load_file("../assets/twitter/twitter_config.yml")
end

def initialize_of_count_tweets
	@logger = Logger.new(STDOUT)
	@logger.level = Logger::INFO
	@tw = TwitterUtil.new(@logger)
	@config = read_configuration
	@fetch_size = @config["fetch_size"]
	@execute_datetime = Time.now()
end

def get_keywords
	keywords = Keyword.all
	return keywords
end

def create_trend_result(keyword, tweets)
	trend = Trend.new()
	trend['category'] = "sake"
	trend['keyword_id'] = keyword['id']
	trend['count'] = tweets.size
	trend['search_datetime'] = @execute_datetime
	return trend
end

def update_keyword(keyword, tweets)
	if !tweets.nil? then
		keyword['since_id'] = tweets[tweets.size - 1]['id']
		keyword.save
	end
end

def execute_search_tweet(keywords)
	keywords.each{|keyword|
		keyword = keyword['keyword']
		since_id = keyword['since_id']
		tweets = nil

		begin
			# search all tweets
			@logger.info("START!!!" + "keyword: " + keyword + ", since_id: " + since_id.to_s)
			tweets = search_all_tweets(keyword, since_id).sort_by{|tweet| tweet['id']}

			# create the trend result
			create_trend_result(keyword, tweets)

			# update keyword data
			update_keyword(keyword, tweets)
		rescue Twitter::Error::TooManyRequests => tw_error
			@logger.error(tw_error.to_s + " during searching " + keyword)
			swith_twitter_account()
		rescue => ex
			@logger.error(ex)
		ensure
			@logger.info("END!!!" + "keyword: " + keyword + ", since_id: " + since_id.to_s)
		end
	}
end

# count tweets per hour
def count_tweets
	# initialize
	initialize_of_count_tweets

	# get the keyword list
	keywords = get_keywords

	# execute process each keyword
	execute_search_tweet(keywords)

end

# update the trendlist of day
def update_trendlist
	puts "TODO"
end


namespace :twitter do
	desc 'count tweets per hour'
	task :count_tweets => :environment do
		count_tweets
	end

	desc 'update the trendlist of day'
	task :update_trendlist => :environment do
		update_trendlist
	end

end
