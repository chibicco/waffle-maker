# frozen_string_literal: true

RSpec.describe Waffle::Maker::Api::AlertDetail do
  include_context :set_sample_config

  describe "#url" do
    it 'log_id parameter' do
      expect(described_class.new(log_id: '123-456-789').url.to_s)
        .to eq('https://example.jp/api/v1/alert_detail?host=example.com&id=ABC1234&log_id=123-456-789')
    end
  end
end
