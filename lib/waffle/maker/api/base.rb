# frozen_string_literal: true

module Waffle
  module Maker
    module Api
      class Base
        FORCE_ENCODING = "UTF-8"
        attr_accessor :url, :headers

        def body_in_hash_format
          get.then do |response|
            JSON.parse(response.body.force_encoding(FORCE_ENCODING))
          end
        end

        def body_in_json_format
          get.then do |response|
            response.body.force_encoding(FORCE_ENCODING)
          end
        end

        def get
          @get ||= http.get(url, headers)
        end

        def http
          Net::HTTP.new(url.host, url.port).tap do |http|
            http.use_ssl = (url.scheme === "https")
          end
        end

        def url
          raise NotImplementedError
        end

        def headers
          @headers ||= { "Content-Type" => "application/json", 'X-Scutum-API-Key' => config.api_key }
        end

        private

        def now
          @_now ||= DateTime.now
        end

        def beginning_of_day
          now.strftime("%Y-%m-%dT00:00:00")
        end

        def end_of_day
          now.strftime("%Y-%m-%dT23:59:59")
        end

        def config
          Waffle::Maker::Api.config
        end

        def routes
          @routes ||= Waffle::Maker::Route.new(Waffle::Maker::Config.default_options[:f], true).paths
        end
      end
    end
  end
end
