module Urbanairship
  class Push
    class << self
      def push(object)
        response = Urbanairship.request(:post, url, object.to_json)
        Urbanairship::Response.new(response)
      end

      private

      def url
        '/api/push'
      end
    end
  end
end
