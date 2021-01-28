# frozen_string_literal: true

RSpec.describe Waffle::Maker::Api::Config do
  describe "host" do
    it 'configure via config block' do
      Waffle::Maker::Api.configure { |c| c.host = 'example.com' }
      expect(Waffle::Maker::Api.config.host).to eq('example.com')
    end
  end

  describe "id" do
    it 'configure via config block' do
      Waffle::Maker::Api.configure { |c| c.id = '1234567890' }
      expect(Waffle::Maker::Api.config.id).to eq('1234567890')
    end
  end

  describe "api_key" do
    it 'configure via config block' do
      Waffle::Maker::Api.configure { |c| c.api_key = '123123123123' }
      expect(Waffle::Maker::Api.config.api_key).to eq('123123123123')
    end
  end

  describe "api_host" do
    it 'configure via config block' do
      Waffle::Maker::Api.configure { |c| c.api_host = 'https://example.com' }
      expect(Waffle::Maker::Api.config.api_host).to eq('https://example.com')
    end
  end
end
