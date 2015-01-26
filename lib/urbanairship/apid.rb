module Urbanairship
  class APID < Base

    def self.register(apid)
      apid_object = new(apid)
      response = Urbanairship.request(:put, apid_object.url)
      Urbanairship::Response.new(response)
    end

    def self.delete(apid)
      apid_object = new(apid)
      response = Urbanairship.request(:delete, apid_object.url)
      Urbanairship::Response.new(response)
    end

    def initialize(apid)
      @id = apid
    end

  end
end
