# frozen_string_literal: true

module Waffle
  module Maker
    class Matcher
      attr_reader :waf_path, :routes

      def initialize(waf_path, routes)
        @waf_path = waf_path.to_s.chomp('/')
        @routes = routes
      end

      def matched?
        return true if routes.include?(waf_path)

        routes.any? do |route|
          -> {
            route = params_route_2_regex_route(route)
            return false if route.start_with?("/#{rep_regex}")
            /#{route}$/.match?(waf_path)
          }.call
        end
      end

      # @override
      def rep_regex
        '(\w+)'
      end

      private

      # /users/:id/edit/:example
      # ↓
      # /users/(.*)/edit/(.*)
      def params_route_2_regex_route(route)
        route.gsub(/:\w+/, rep_regex)
      end
    end
  end
end
