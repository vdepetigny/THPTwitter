# ligne très importante qui appelle la gem.
require 'twitter'

# n'oublie pas les lignes pour Dotenv ici…
require 'dotenv'
Dotenv.load
# quelques lignes qui appellent les clés d'API de ton fichier .env

def streaming_twitter
	client = Twitter::Streaming::Client.new do |config|
	  config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
	  config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
	  config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
	  config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
	end
	# ligne qui permet de tweeter sur ton compte
	# client.update('Mon premier tweet en Ruby !!!!')

	return client
end

def login_twitter
	restclient = Twitter::REST::Client.new do |config|
	  config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
	  config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
	  config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
	  config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
	
	end
	return restclient
end

def like_follow_live
# my_array = []
# streaming_twitter.filter(track: "Hello") {|object|  my_array << object if object.is_a?(Twitter::Tweet)}
# login_twitter.favorite (my_array)
# end

#topics = ["#hello"]    #saisie de la donnee recherchee
streaming_twitter.filter(track: "Hello") do |tweet|
 #utilisation du logstreaming pour filtrer les resultat contenant la track: topics
   puts "#{tweet.user.screen_name}: #{tweet.text}"
   if tweet.is_a?(Twitter::Tweet)
     login_twitter.favorite(tweet.id)
     login_twitter.follow(tweet.user)
   end
end
end

like_follow_live