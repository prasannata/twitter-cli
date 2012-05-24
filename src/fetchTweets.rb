#!/usr/bin/ruby

require 'httpHelper'
require 'tweet'

class FetchTweets
  def initialize(user)
    @user = user
  end
  def execute
    params = {}
    params['include_entities'] = 'true'
    params['screen_name'] = "#{@user}"
    params['count'] = '5'
    
    tweetsJson = HttpHelper.doGet('statuses/user_timeline.json', params)    
    tweetsJson.each do |json|
      tweet = Tweet.new
      tweet.text = json['text']
      puts tweet.to_s
      puts "@" + json['user']['screen_name'].to_s	  
      puts "-----------------------------------------------------------------------------------"      
    end
  end
end
