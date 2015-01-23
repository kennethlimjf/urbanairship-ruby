module Urbanairship
  class Base
    attr_accessor :id

    class << self
      def url
        check_base
        "/api/#{CGI.escape(class_name)}s"
      end

      def class_name
        underscore self.to_s.split("::").last
      end

      # Extracted from ActiveSupport::Inflector
      def underscore(word)
        word.gsub!(/(?:([A-Za-z\d])|^)(#{/(?=a)b/})(?=\b|[^a-z])/) { "#{$1}#{$1 && '_'}#{$2.downcase}" }
        word.gsub!(/([A-Z\d]+)([A-Z][a-z])/,'\1_\2')
        word.gsub!(/([a-z\d])([A-Z])/,'\1_\2')
        word.tr!("-", "_")
        word.downcase!
        word
      end

      def check_base
        if self == Base || self.class == Base
          raise UrbanairshipError.new('Urbanairship::Base is an abstract class. Please use subclasses.')
        end
      end
    end

    def url
      "#{self.class.url}/#{CGI.escape(id)}"
    end

    def stringify_hash_values(hash)
      hash.each do |k, v|
        if v.class == Hash
          stringify_hash_values(v)
        elsif v.class == Array
          # Do nothing
        else
          hash[k] = v.to_s
        end
      end
    end

    def to_json
      self.class.check_base
      stringify_hash_values(payload).to_json
    end

    def all? item
      return true if (item.eql?("all") || item.eql?(:all))
      false
    end
  end
end
