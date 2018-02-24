#!/usr/bin/env ruby

require 'twitter'
require 'logger'

logger = Logger.new(STDOUT)

client = Twitter::REST::Client.new do |config|
  config.consumer_key = ENV['CONSUMER_KEY']
  config.consumer_secret = ENV['CONSUMER_SECRET']
  config.access_token = ENV['ACCESS_TOKEN']
  config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
end

logger.info('Loading tweets...')

user_handle = ENV['USER_HANDLE']

options = {
  count: 200,
  include_rts: false,
  exclude_replies: true
}

tweets = client.user_timeline(user_handle, options)
tweets.each do |tweet|
  puts "tweet #{tweet.id}: #{tweet.text}"
end
