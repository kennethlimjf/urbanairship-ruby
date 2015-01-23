module Urbanairship
  class UrbanairshipError < StandardError
    attr_reader :message
    attr_reader :http_status
    attr_reader :body

    def initialize(message=nil, http_status=nil, body=nil)
      @message = message
      @http_status = http_status
      @body = body
    end

    def to_s
      "#{self.class}: #{http_status} - #{message}"
    end
  end
end
