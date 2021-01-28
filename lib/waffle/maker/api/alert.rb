# frozen_string_literal: true

module Waffle
  module Maker
    module Api
      class Alert < Base
        API_PATH = '/api/v1/alert'
        attr_reader :time_order, :from, :to, :ip, :marker

        def initialize(time_order: nil, from: nil, to: nil, ip: nil, marker: nil)
          @time_order = time_order
          @from = from
          @to = to
          @ip = ip
          @marker = marker
        end

        def execute
          body_in_hash_format
        end

        def matched_with_routes
          body_in_hash_format.tap do |body|
            body['data'].select! { |d| Waffle::Maker::Matcher.new(d['uri'], routes).matched? }
          end
        end

        def url
          return @url if @url

          url_string = "#{config.api_host}#{API_PATH}?host=#{config.host}&id=#{config.id}"
          url_string = "#{url_string}&time_order=#{@time_order}" if @time_order
          url_string = "#{url_string}&from=#{@from}" if @from
          url_string = "#{url_string}&to=#{@to}" if @to
          url_string = "#{url_string}&ip=#{@ip}" if @ip
          url_string = "#{url_string}&marker=#{@marker}" if @marker

          @url = URI.parse(url_string)
        end
      end
    end
  end
end
