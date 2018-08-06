require 'rails_helper'

RSpec.describe List, type: :model do
  context 'Validation' do
    let(:list) { create(:list) }

    it 'True validation' do
      expect(list.valid?).to eq(true)
    end

    it 'short title' do
      list.title = 'a'
      expect(list.valid?).to eq(false)
    end

    it 'not have title' do
      list.title = nil
      expect(list.valid?).to eq(false)
    end

    it 'not have dashboard' do
      list.dashboard = nil
      expect(list.valid?).to eq(false)
    end
  end
  context 'collback' do
    let(:list) { create(:list) }
    it 'correct title' do
      list.title = '    Title    title    '
      list.valid?
      expect(list.title).to eq('Title title')
    end
  end
end
