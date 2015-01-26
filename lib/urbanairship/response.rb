module Urbanairship
  class Response
    attr_accessor :ok, :body, :push_ids, :code

    def initialize(response)
      unless response.body.nil?
        @body = JSON.parse(response.body)
        @push_ids = @body["push_ids"]
        @ok = @body["ok"]
      end
      @code = response.code
    end
  end
end
