require 'active_support/core_ext/hash'
require "mautic/version"
require "mautic/configuration"
require "mautic/contacts"
require "mautic/companies"
require "oauth2"

module Mautic
  class << self
    attr_writer :configuration
    attr_accessor :token

    def token
     @token ||= get_token
    end

    def configuration
     @configuration ||= Configuration.new
    end

    def configure
     yield(configuration)
     #Generating Token
     token
    end

    def public_key
      @configuration.try(:public_key)
    end

    def secret_key
      @configuration.try(:secret_key)
    end

    def mautic_url
      @configuration.try(:mautic_url)
    end

    def token_hash
      @configuration.try(:token_hash)
    end

    def get_token
      client = OAuth2::Client.new( public_key, secret_key, :site => mautic_url,:token_url => "/oauth/v2/token", :authorize_url => "/oauth/v2/authorize")
      OAuth2::AccessToken.new(client,token_hash)
    end

    def update_token
      @token = get_token
    end

    def get_request(path)
      if Mautic.configuration.enabled
        Mautic.token.get(path)
      else
        OAuth2::Response.new({})
      end
    end

    def post_request(path, options = {})
      if Mautic.configuration.enabled
       Mautic.token.post(path, options)
      else
        OAuth2::Response.new({})
      end
    end

    def patch_request(path, options = {})
      if Mautic.configuration.enabled
        Mautic.token.patch(path, options)
      else
        OAuth2::Response.new({})
      end
    end

    def delete_request(path)
      if Mautic.configuration.enabled
        Mautic.token.delete(path)
      else
        OAuth2::Response.new({})
      end
    end
  end
end
