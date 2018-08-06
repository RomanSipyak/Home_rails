require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'validates' do
    let(:comment) { create(:comment) }

    it 'true validation' do
      expect(comment.valid?).to eq(true)
    end

    it 'not have card ' do
      comment.card = nil
      expect(comment.valid?).to eq(false)
    end
  end
  context 'Asociating' do
    it { is_expected.to belong_to(:card) }
    it { is_expected.to have_one(:attachment) }
  end
end
