# frozen_string_literal: true
require "waffle/maker/version"
require "waffle/maker/route"
require "waffle/maker/waf"
require "waffle/maker/matcher"
require "waffle/maker/api"
require "waffle/maker/railtie" if defined?(::Rails)

module Waffle
  module Maker
    class Error < StandardError; end

    class Config
      class << self
        def default_options
          { f: 2, w: 2, silent_error: false }
        end
      end
    end

    class Filter
      attr_reader :options

      class << self
        def execute
          Waffle::Maker::Filter.new(ARGV.dup).execute
        end
      end

      def initialize(argv)
        (@options = Waffle::Maker::Config.default_options).tap do |options|
          OptionParser.new { |o|
            o.banner = "Usage: #{$0}"
            o.on("-f number", "Column number that contains the rails path") { |v| options[:f] << v.to_i }
            o.on("-w number", "Column number that contains the waf path") { |v| options[:w] << v.to_i }
            o.on("--silent-error", "Hide parsing errors, default is false") { |v| options[:silent_error] << v }
          }.parse!(argv)
        end
      end

      def execute
        wafs.each do |waf|
          puts waf[:raw] if Waffle::Maker::Matcher.new(waf[:path], routes).matched?
        end
      end

      private

      def routes
        @routes ||= Waffle::Maker::Route.new(options[:f], options[:silent_error]).paths
      end

      def wafs
        @wafs ||= Waffle::Maker::Waf.new(options[:w])
      end
    end
  end
end
