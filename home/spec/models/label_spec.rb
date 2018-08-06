require 'rails_helper'

RSpec.describe Label, type: :model do
  context 'validates' do
    let(:label) { create(:label) }

    it 'true validation' do
      expect(label.valid?).to eq(true)
    end

    it 'not have card ' do
      label.dashboard = nil
      expect(label.valid?).to eq(false)
    end
  end
  context 'Asociation' do
    it { is_expected.to belong_to(:dashboard) }
    it { is_expected.to have_and_belong_to_many(:cards) }
  end
end
