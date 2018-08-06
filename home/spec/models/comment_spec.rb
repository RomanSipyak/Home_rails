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
end
