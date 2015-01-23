require 'cgi'
require 'json'
require 'net/http'

# Version
require 'urbanairship/version'

# Errors
require 'urbanairship/errors/urbanairship_error'

# Urbanairship Objects
require 'urbanairship/base'
require 'urbanairship/apid'
require 'urbanairship/device_token'
require 'urbanairship/push_object'
require 'urbanairship/push'

module Urbanairship

  @api_base = 'https://go.urbanairship.com'

  class << self
    attr_accessor :application_key, :application_secret, :master_secret
  end
  
  def self.api_url(url='')
    @api_base + url
  end

  def self.request(method, url, body = nil)
    check_application_keys
    request = build_request(method, url, body)
    response = http_client.request(request)
  end

  private

  def self.http_client
    uri = URI.parse(@api_base)
    Net::HTTP.new(uri.host, uri.port).tap{ |http| http.use_ssl = true; }
  end

  def self.build_request(method, url, body)
    request = Net::HTTP.const_get(method.to_s.capitalize).new(url)
    request.basic_auth @application_key, @master_secret
    request.add_field "Content-Type", "application/json"
    request["Accept"] = "application/vnd.urbanairship+json; version=3;"
    request.body = body if body
    request
  end

  def self.check_application_keys
    unless application_key && application_secret && master_secret
      raise UrbanairshipError.new "Need to configure Urbanairship keys"
    end
  end
end
