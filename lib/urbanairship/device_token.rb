module Urbanairship
  class DeviceToken < Base

    def self.register(device_token)
      device_token_object = new device_token
      response = Urbanairship.request(:put, device_token_object.url)
      Urbanairship::Response.new(response)
    end

    def self.delete(device_token)
      device_token_object = new device_token
      response = Urbanairship.request(:delete, device_token_object.url)
      Urbanairship::Response.new(response)
    end

    def initialize(device_token)
      @id = device_token
    end

  end
end
