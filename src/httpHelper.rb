#!/usr/bin/ruby

require 'rubygems'
require 'rest_client'
require 'json/pure'
require 'addressable/uri'

class HttpHelper

    @@restService = 'https://api.twitter.com/1'
    @@authorization = nil
    @@header = {:accept => :json, :Authorization => @@authorization}
    
	def self.doGet(relativeUrl, queryParams)	
	  uri = Addressable::URI.join(@@restService, relativeUrl)
	  uri.query_values = queryParams
	  response = RestClient.get uri.to_s, @@header
	  return JSON.parse(response.body)    
	end
end
