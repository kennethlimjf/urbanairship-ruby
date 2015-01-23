module Urbanairship
  class APID < Base

    def self.register(apid)
      apid_object = new(apid)
      Urbanairship.request(:put, apid_object.url)
    end

    def self.delete(apid)
      apid_object = new(apid)
      Urbanairship.request(:delete, apid_object.url)
    end

    def initialize(apid="")
      @id = apid
    end

  end
end
