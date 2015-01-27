module Urbanairship
  class Response
    attr_accessor :ok, :body, :push_ids, :code

    def initialize(response=nil)
      unless response.nil? || response.body.nil?
        @body = JSON.parse(response.body)
        @push_ids = @body["push_ids"]
        @ok = @body["ok"]
        @code = response.code
      end
    end
  end
end
