# frozen_string_literal: true

RSpec.describe Waffle::Maker::Route do
  let(:route) { Waffle::Maker::Route.new(2) }

  describe "#rails" do
    before do
      allow(Waffle::Maker::Route::Rails).to receive(:formatted_inspector).and_return(inspector)
    end

    context "when simple routes" do
      let(:inspector) do
        "home,GET,/home(.:format),homes#show\nroot,GET,/,no_auth#show"
      end

      it "successfully parse csv" do
        expect(route.send(:rails)).to be_a_kind_of(Array)
      end
    end
  end
end
