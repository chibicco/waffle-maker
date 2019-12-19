# frozen_string_literal: true

RSpec.describe Waffle::Maker do
  it "has a version number" do
    expect(Waffle::Maker::VERSION).not_to be nil
  end

  let(:argv) { [''] }
  let(:filter) { Waffle::Maker::Filter.new(argv) }

  describe "#execute" do
    before do
      allow(filter).to receive(:routes).and_return(routes)
      allow(filter).to receive(:wafs).and_return(wafs)
    end

    context "when there is a matching log" do
      let(:routes) { %w(/users /users/:id /users/:id/example/:name) }
      let(:wafs) do
        [
          { raw: "2019/01/01 01:01:01\t8.8.8.8\t/users\t攻撃\t○", path: "/users" },
          { raw: "2019/01/02 01:01:01\t8.8.8.8\t/users/1\t攻撃\t○", path: "/users/1" },
          { raw: "2019/01/03 01:01:01\t8.8.8.8\t/users/1/example/my_name\t攻撃\t○", path: "/users/1/example/my_name" },
          { raw: "2019/01/03 01:01:01\t8.8.8.8\t/users/1/example\t攻撃\t○", path: "/users/1/example" },
        ]
      end
      let(:stdout) { "#{wafs[0][:raw]}\n#{wafs[1][:raw]}\n#{wafs[2][:raw]}\n" }

      it do
        expect { filter.execute }.to output(stdout).to_stdout
      end
    end

    context "when there is not a matching log" do
      let(:routes) { %w(/users /users/:id /users/:id/example/:name) }
      let(:wafs) do
        [
          { raw: "2019/01/01 01:01:01\t8.8.8.8\t/root\t攻撃\t○", path: "/root" },
        ]
      end
      let(:stdout) { "" }

      it do
        expect { filter.execute }.to output(stdout).to_stdout
      end
    end
  end
end
