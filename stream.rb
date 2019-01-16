# ligne très importante qui appelle la gem.
require 'twitter'

# n'oublie pas les lignes pour Dotenv ici…
require 'dotenv'
Dotenv.load
# quelques lignes qui appellent les clés d'API de ton fichier .env

def streaming_twitter
	client_stream = Twitter::Streaming::Client.new do |config|
	  config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
	  config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
	  config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
	  config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
	end
	return client_stream
end

def login_twitter
	client = Twitter::REST::Client.new do |config|
	  config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
	  config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
	  config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
	  config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
	
	end
	return client
end

def like_follow_live
streaming_twitter.filter(track: "hello"){|object| puts object.text if object.is_a?(Twitter::Tweet)}
end


# client = streaming_twitter
# topics = ["bonjour", "bonjour_monde"]
# puts topics
# client.filter(track: topics.join(",")) do |tweet|
# puts tweet.text
# end
# end


like_follow_live 
