# frozen_string_literal: true
require "date"
require "json"
require "net/http"
require "waffle/maker/api/base"
require "waffle/maker/api/alert"
require "waffle/maker/api/alert_detail"
require "waffle/maker/api/config"

module Waffle
  module Maker
    module Api
      class << self
        def configure
          yield config
        end

        def config
          @config ||= Config.new
        end
      end
    end
  end
end
