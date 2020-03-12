# frozen_string_literal: true
require "waffle/maker/formatter"
require 'csv'

module Waffle
  module Maker
    class Route
      attr_accessor :path_position, :silent_error

      def initialize(path_position, silent_error)
        self.path_position = path_position
        self.silent_error = silent_error
      end

      def all
        defined?(::Rails) ? rails : default
      end

      def paths
        all.each.with_object([]) do |v, o|
          o << v[path_position].gsub(/\(\.:format\)$/, "")
        end
      end

      # @override
      def default
        []
      end

      private

      class Rails
        class << self
          def routes
            ::Rails.application.routes.routes
          end

          def inspector
            ::ActionDispatch::Routing::RoutesInspector.new(Waffle::Maker::Route::Rails.routes)
          end

          # @param [Boolean] silent_error
          def formatted_inspector(silent_error)
            Waffle::Maker::Route::Rails.inspector.format(Waffle::Maker::Formatter.new(silent_error))
          end
        end
      end

      # [
      # ["home", "GET", "/home(.:format)", "homes#show"],
      # ["user", "GET", "/user(.:format)", "users#show"],
      # ...
      # ]
      def rails
        CSV.parse(Waffle::Maker::Route::Rails.formatted_inspector(silent_error))
      end
    end
  end
end
