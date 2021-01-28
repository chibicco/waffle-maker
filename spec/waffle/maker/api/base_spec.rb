# frozen_string_literal: true

RSpec.describe Waffle::Maker::Api::Base do
  include_context :set_sample_config

  describe "#headers" do
    it 'valid parameter' do
      expect(described_class.new.headers)
        .to eq({ "Content-Type" => "application/json", 'X-Scutum-API-Key' => '123123123123123123123123123123123123' })
    end
  end
end
