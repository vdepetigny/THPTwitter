# This is your main program file

# Load the dotenv gem
require 'dotenv'

# This tells dotenv to read the .env file and set the appropriate values in ENV
Dotenv.load

#'../.env'

# Assuming we used the example .env file above, ENV['TWITTER_API_SECRET'] should
# now contain the string "my-twitter-api-secret".

puts ENV['TWITTER_API_SECRET']
puts ENV