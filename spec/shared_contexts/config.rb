# frozen_string_literal: true

RSpec.shared_context :set_sample_config do
  before do
    Waffle::Maker::Api.configure do |config|
      config.host = "example.com"
      config.api_host = "https://example.jp"
      config.id = "ABC1234"
      config.api_key = "123123123123123123123123123123123123"
    end
  end
end
