# frozen_string_literal: true

module Waffle
  module Maker
    class Formatter
      def initialize(silent_error = false)
        @silent_error = silent_error
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
          begin
            @buffer << [r[:name], r[:verb], r[:path], r[:reqs]].join(",").tap { |line| CSV.parse(line) }
          rescue CSV::MalformedCSVError => e
            puts "[ERROR] name:#{r[:name]} verb: #{r[:verb]} path:#{r[:path]} reqs:#{r[:reqs]} message:#{e}" unless @silent_error
          end
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
