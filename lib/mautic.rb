require 'active_support/core_ext/hash'
require "mautic/version"
require "mautic/configuration"
require "mautic/contacts"
require "oauth2"


module Mautic
 

 class << self
   attr_writer :configuration
   attr_accessor :token
 end
 def self.token
   @token ||= get_token
 end
 def self.configuration
   @configuration ||= Configuration.new
 end

 def self.configure
   yield(configuration)
   #Generating Token
   token
 end

 def self.public_key
 	@configuration.try(:public_key)
 end

 def self.secret_key
 	@configuration.try(:secret_key)
 end

 def self.mautic_url
 	@configuration.try(:mautic_url)
 end
 def self.token_hash
 	@configuration.try(:token_hash)
 end
 def self.get_token
 	client = OAuth2::Client.new( public_key, secret_key, site: mautic_url, token_url: "/oauth/v2/token", authorize_url: "/oauth/v2/authorize")
	token =  OAuth2::AccessToken.new(client,token_hash)
	return token
 end

 def self.update_token
  @token = get_token
 end

end
