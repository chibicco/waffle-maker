# frozen_string_literal: true

module Waffle
  module Maker
    class Formatter
      def initialize
        @buffer = []
      end

      def result
        @buffer.join("\n")
      end

      def section_title(_title)
        # noop
      end

      def section(routes)
        routes.each do |r|
          @buffer << [r[:name], r[:verb], r[:path], r[:reqs]].join(",")
        end
      end

      def header(_routes)
        # noop
      end

      def no_routes
        # noop
      end
    end
  end
end
