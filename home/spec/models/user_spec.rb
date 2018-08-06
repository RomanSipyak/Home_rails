require 'rails_helper'
RSpec.describe User, type: :model do
  context 'validates' do
    let(:user) { build(:user) }
    it 'correct parameters' do
      expect(user.valid?).to eq(true)
    end
    it 'not have name' do
      user.username = nil
      expect(user.valid?).to eq(false)
    end

    it 'no valid email' do
      user.email = 'asdssd'
      expect(user.valid?).to eq(false)
    end

    it 'no have email' do
      user.email = nil
      expect(user.valid?).to eq(false)
    end

    it 'no valid password' do
      user.password = nil
      expect(user.valid?).to eq(false)
    end

    it 'no valid too short' do
      user.password = '123'
      expect(user.valid?).to eq(false)
    end
  end
  context 'scopes' do
    let(:user) { create(:user) }
    it 'scope  by_title' do
      expect(User.by_username('an')).to contain_exactly(user)
    end
  end
  context 'Asociation' do
    it { is_expected.to have_many(:memberships) }
    it { is_expected.to have_many(:dashboards).dependent(:nullify) }
    it { is_expected.to have_and_belong_to_many(:cards)}
  end
end
