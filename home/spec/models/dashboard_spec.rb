require 'rails_helper'

RSpec.describe Dashboard, type: :model do
  context 'validates' do
    let(:dashboard) { create(:dashboard) }

    it 'true validation' do
      expect(dashboard.valid?).to eq(true)
    end
    it 'not have owner ' do
      dashboard.user = nil
      expect(dashboard.valid?).to eq(false)
    end
    it 'short title' do
      dashboard.title = 'asd'
      expect(dashboard.valid?).to eq(false)
    end
  end
  context 'collback' do
    let(:dashboard) { create(:dashboard) }
    it 'correct title' do
      dashboard.title = '    Title    title    '
      dashboard.valid?
      expect(dashboard.title).to eq('Title title')
    end
  end
  context 'scope' do
    let(:dashboard) { create(:dashboard) }
    let(:dashboard2) { create(:dashboard, title: 'AAaaaaa') }
    it 'scope ordered_by_title' do
      expect(Dashboard.ordered_by_title).to contain_exactly(dashboard2, dashboard)
    end
  end
end
