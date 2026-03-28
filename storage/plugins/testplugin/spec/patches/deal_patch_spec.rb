require 'rails_helper'

RSpec.describe 'Deal patch (testplugin)' do
  let(:original) { Rails.root.join('app/models/deal.rb').read }

  before { Plugins::FilePatch.clear_registry! }
  after  { Plugins::FilePatch.clear_registry! }

  it 'adds the include line for DealAiScoreExtension' do
    load Rails.root.join('storage/plugins/testplugin/app/models/deal.rb')
    result = Plugins::FilePatch.apply('app/models/deal.rb', original)

    expect(result).to include('include Plugins::Testplugin::DealAiScoreExtension')
  end

  it 'adds the include line for DealFollowUpExtension' do
    load Rails.root.join('storage/plugins/testplugin/app/models/deal.rb')
    result = Plugins::FilePatch.apply('app/models/deal.rb', original)

    expect(result).to include('include Plugins::Testplugin::DealFollowUpExtension')
  end

  it 'does not modify the original file' do
    original_content = Rails.root.join('app/models/deal.rb').read
    expect(original_content).not_to include('Plugins::Testplugin::DealAiScoreExtension')
    expect(original_content).not_to include('Plugins::Testplugin::DealFollowUpExtension')
  end
end
