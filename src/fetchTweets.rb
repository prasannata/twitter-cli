#!/usr/bin/ruby

class FetchTweets
  def initialize(user)
    @user = user
  end
  def execute
    puts "fetching tweets for " + @user
  end
end
