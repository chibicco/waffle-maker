# frozen_string_literal: true

module Waffle
  module Maker
    module Api
      class AlertDetail < Base
        API_PATH = '/api/v1/alert_detail'
        attr_reader :log_id

        def initialize(log_id: nil)
          @log_id = log_id
        end

        def execute
          body_in_hash_format
        end

        def url
          @url ||= URI.parse("#{config.api_host}#{API_PATH}?host=#{config.host}&id=#{config.id}&log_id=#{log_id}")
        end
      end
    end
  end
end
