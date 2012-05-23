#!/usr/bin/ruby

require 'optparse'
require 'fetchTweets'

class Twitter
  def self.parse(args)
    options = {}
    optparse = OptionParser.new do|opts|
      opts.banner = "Usage: twitter [options]"

      options[:user] = nil

      opts.on( '-u', '--user handle', String, 'Display tweets by user' ) do |u|
         options[:user] = FetchTweets.new(u)
      end

      opts.on( '-h', '--help', 'Display this screen' ) do
         puts opts
         exit
      end
      opts.parse!(args)
    end

    options
  end
end

options = Twitter.parse(ARGV)
options.values.each do |opt|
  opt.execute
end
