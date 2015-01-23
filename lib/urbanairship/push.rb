module Urbanairship
  class Push
    class << self
      def push(object)
        Urbanairship.request(:post, url, object.to_json)
      end

      private

      def url
        '/api/push'
      end
    end
  end
end
