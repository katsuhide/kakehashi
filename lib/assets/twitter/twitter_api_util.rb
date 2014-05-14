# -*- encoding: utf-8 -*-
require 'twitter'
require 'logger'

class TwitterAPIError < StandardError
end

class TwitterUtil
	## 	initialize
	def initialize(log = nil, config)
		@config = config
		@logger = log
		if @logger.nil? then
			@logger = Logger.new(STDOUT)
			@logger.level = Logger::INFO
		end
		@logger.debug("Twitter Util initialize")
		@loop_count = 0
		create_client(get_available_client())
	end

	## 	get next index of twitter client
	def get_next_client_index(in_use_index)
		current_index = in_use_index.nil? ? -1: in_use_index
		client_num = @config['twitter_oauth_count']
		# if current_index >= (client_num - 1)
		if @loop_count.nil?
			@loop_count = 0
		elsif @loop_count >= 3
			@logger.warn('[get_next_client_index] loop_count has been exceeded from limit.')
			raise TwitterAPIError.new('Have no more api client.' )
		end
		# return current_index + 1
		next_index = current_index < (client_num - 1) ? current_index + 1 : current_index + 1 - client_num
		if next_index == 0 && current_index != -1
			sleep @config['sleep_time'].to_i
			@loop_count += 1
			@logger.warn('[get_next_client_index] Go to the next round of the api client. [loop_count: ' + @loop_count.to_s + ']')
		end
		return next_index
		# return current_index < (client_num - 1) ? current_index + 1 : current_index + 1 - client_num
	end

	## 	get available client
	def get_available_client()
		@in_use_index = get_next_client_index(@in_use_index)
		oauth = Hash.new()
		oauth['consumer_key'] = @config['consumer_keys'][@in_use_index]
		oauth['consumer_secret'] = @config['consumer_secrets'][@in_use_index]
		oauth['access_token'] = @config['access_tokens'][@in_use_index]
		oauth['access_token_secret'] = @config['access_token_secrets'][@in_use_index]
		@logger.info('[get_available_client] Have gotten the oauth info.')
		return oauth
	end

	## 	create the twitter client
	def create_client(oauth)
		@client = Twitter::REST::Client.new(
			consumer_key: oauth["consumer_key"],
			consumer_secret: oauth["consumer_secret"],
			access_token: oauth["access_token"],
			access_token_secret: oauth["access_token_secret"]
			)
	end

	## 	change twitter client
	def change_client
		create_client(get_available_client())
		@logger.info('[change_client] Twitter API Client has been changed.')
	end

	## 	print tweet
	def print_tweet(tweet)
		if !tweet.nil? then
			h = Hash::new
			h.store("id", tweet.id)
			h.store("time", tweet.created_at)
			h.store("text", tweet.text)
			# @logger.debug(p h)
		end
	end

	## 	print result of the search tweets method
	def print_tweets(tweets)
		tweets.each{ |tweet|
			print_tweet(tweet)
		}
	end

	## 	get twitter client
	def get_client
		return @client
	end

	##  	search latest tweet
	def search_tweet(keyword)
		tweet =  @client.search(keyword, :count => 1, :result_type => "recent").take(1)[0]
		return tweet
	end

	## 	get min id of the tweets
	def get_min_id(tweets)
		ids = []
		tweets.each{|tweet|
			ids.push(tweet['id'])
		}
		return ids.min
	end

	## 	get max id of the tweets
	def get_max_id(tweets)
		ids = []
		tweets.each{|tweet|
			ids.push(tweet['id'])
		}
		return ids.max
	end

	## 	search tweets method
	def search_tweets(fetch_size, keyword, since_id)
		tweets = @client.search(keyword, :count => fetch_size, :result_type => "recent", :since_id => since_id).take(fetch_size)
		print_tweets(tweets)
		return  tweets
	end

	## 	search tweets method by since_id and max_id
	def search_tweets_by_both(fetch_size, keyword, since_id, max_id)
		tweets =  @client.search(keyword, :count => fetch_size, :result_type => "recent", :since_id => since_id, :max_id => max_id).take(fetch_size)
		print_tweets(tweets)
		return  tweets
	end

end
