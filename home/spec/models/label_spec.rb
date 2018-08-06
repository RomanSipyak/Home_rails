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
end
