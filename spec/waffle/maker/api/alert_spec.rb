# frozen_string_literal: true

RSpec.describe Waffle::Maker::Api::Alert do
  include_context :set_sample_config

  describe "#url" do
    it 'date parameter' do
      expect(described_class.new(from: '2021-01-01T12:00:00', to: '2021-01-01T13:00:00').url.to_s)
        .to eq('https://example.jp/api/v1/alert?host=example.com&id=ABC1234&from=2021-01-01T12:00:00&to=2021-01-01T13:00:00')
    end

    it 'ip parameter' do
      expect(described_class.new(ip: '127.0.0.1').url.to_s)
        .to eq('https://example.jp/api/v1/alert?host=example.com&id=ABC1234&ip=127.0.0.1')
    end

    it 'time_order parameter' do
      expect(described_class.new(time_order: 'asc').url.to_s)
        .to eq('https://example.jp/api/v1/alert?host=example.com&id=ABC1234&time_order=asc')
    end
  end
end
