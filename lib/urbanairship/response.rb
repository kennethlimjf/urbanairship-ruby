module Urbanairship
  class Response
    attr_accessor :body, :push_id

    def initialize(response)
      @body = JSON.parse(response.body)
      @push_id = @body["push_id"]
    end
  end
end
