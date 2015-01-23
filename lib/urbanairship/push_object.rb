module Urbanairship
  class PushObject < Base

    attr_accessor :audience, :notification, :device_types

    class << self
      def create(options = {})
        instance = new
        options.each{|method, args| instance.send(method, args)}
        instance
      end

      def audience(device_tokens: [], apids: [])
        dt_ary = device_tokens.reduce([]){ |acc,v| acc << { device_token: v } }
        apid_ary = apids.reduce([]){ |acc,v| acc << {apid: v} }
        { OR: dt_ary + apid_ary }
      end

      def notification(alert: "", extra: {})
        {
          alert: alert,
          ios: { extra: extra },
          android: { extra: extra }
        }
      end

      def device_tokens(ary)
        dt_ary = ary.reduce([]){ |acc,v| acc << { device_token: v } }
        { OR: dt_ary }
      end

      def apids(ary)
        dt_ary = ary.reduce([]){ |acc,v| acc << { apid: v } }
        { OR: dt_ary }
      end
    end

    def initialize
      @audience = {}
      @notification = {}
      @device_types = :all
    end

    def audience(params={})
      if params.empty?
        return @audience
      elsif all?(params)
        @audience = :all
      else
        @audience.merge!(params)
      end
      self
    end

    def notification(params={})
      if params.empty?
        return @notification
      else
        @notification.merge!(params)
      end
      self
    end

    def device_types(params={})
      if params.empty?
        return @device_types
      else
        @device_types = params
      end
    end

    def push
      Urbanairship::Push.push self
    end

    def payload
      { 
        "audience" => @audience,
        "notification" => @notification,
        "device_types" => @device_types
      }
    end
  end
end
