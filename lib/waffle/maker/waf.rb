# frozen_string_literal: true
require "waffle/maker/formatter"
require 'csv'

module Waffle
  module Maker
    class Waf
      attr_accessor :path_position

      def initialize(path_position)
        self.path_position = path_position
      end

      # [
      # { raw: "2019/01/01 01:01:01\t8.8.8.8\t/homes\t攻撃\t○", path: "/hoems" },
      # { raw: "2019/01/01 01:01:01\t8.8.8.8\t/users\t攻撃\t○", path: "/users" },
      # ...
      # ]
      def each(&_block)
        $stdin.each(chomp: true) do |line|
          o = {
            raw: line,
            path: line.split(/#{parse_symbol}/)[path_position]
          }
          yield o
        end
      end

      # @override
      def parse_symbol
        ENV.fetch("IFS", "\t")
      end
    end
  end
end
