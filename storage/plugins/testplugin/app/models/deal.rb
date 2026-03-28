Plugins::FilePatch.define target: 'app/models/deal.rb' do
  after_line containing: 'class Deal < ApplicationRecord' do
    "  include Plugins::Testplugin::DealAiScoreExtension\n  include Plugins::Testplugin::DealFollowUpExtension"
  end
end
