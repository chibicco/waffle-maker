desc <<-EOS
  desc. waffle
EOS

namespace :waffle do
  task filter: :environment do
    Waffle::Maker::Filter.execute
  end
end
