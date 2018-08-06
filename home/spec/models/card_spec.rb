require 'rails_helper'

RSpec.describe Card, type: :model do
  context 'validates' do
    let(:card) { create(:card) }

    it 'true validation' do
      expect(card.valid?).to eq(true)
    end

    it 'not have list ' do
      card.list = nil
      expect(card.valid?).to eq(false)
    end

    it 'short title' do
      card.title = 'asd'
      expect(card.valid?).to eq(false)
    end

    it 'not have title' do
      card.title = nil
      expect(card.valid?).to eq(false)
    end
  end
  context 'collback' do
    let(:card) { create(:card) }
    it 'correct title' do
      card.title = '    Title    title    '
      card.valid?
      expect(card.title).to eq('Title title')
    end
  end
  context 'scopes' do
    let(:card) { create(:random_c) }
    let(:card2) { create(:random_c) }
    let(:card3) { create(:random_c) }
    let(:labels) { build_list(:label, 3) }
    let(:label) { create(:label) }
    let(:label2) { create(:label, color: 'green') }
    it 'scope by_labels' do
      card.labels = labels
      card2.labels = labels
      card3.labels = labels
      card2.labels << label
      card3.labels << label
      labels.each(&:save)

      expect(Card.by_labels(label)).to contain_exactly(card2, card3)
    end
    it 'scope by_labels' do
      card.labels = labels
      card2.labels = labels
      card3.labels = labels
      card2.labels << label
      card3.labels << label2
      labels.each(&:save)
      expect(Card.by_labels([label, label2])).to contain_exactly(card2, card3)
    end
    let(:user) { create(:random_user) }
    let(:user2) { create(:random_user) }
    let(:users) { build_list(:random_user, 5) }
    it 'scope  by_assigned_users' do
      card.users = users
      card2.users = users
      card3.users = users
      card2.users << user
      card3.users << user
      users.each(&:save)
      expect(Card.by_assigned_users(user)).to contain_exactly(card2, card3)
    end
    it 'scope  by_assigned_users' do
      card.users = users
      card2.users = users
      card3.users = users
      card2.users << user
      card3.users << user2
      users.each(&:save)
      expect(Card.by_assigned_users([user,user2])).to contain_exactly(card2, card3)
    end
    it 'scope  by_title' do
      card2.title = "bbbaaaamm"
      card3.title = "aaaaaa"
      card2.save
      card3.save
      expect(Card.by_title("aaaa")).to contain_exactly(card2, card3)
    end

    it 'scope  should_be_done_until' do
      card2.date = Time.now
      card3.date = Time.now
      card2.save
      card3.save
      expect(Card.should_be_done_until(Time.now + 5.days)).to contain_exactly(card2, card3)
    end
    it 'scope  should_be_done_until' do
      card2.complitely_date = Time.now
      card3.complitely_date = Time.now
      card2.save
      card3.save
      expect(Card.should_be_done_until(Time.now + 5.days)).to contain_exactly
    end
    it 'scope  should_be_done_until' do
      card2.complitely_date = Time.now
      card3.date = Time.now
      card2.save
      card3.save
      expect(Card.should_be_done_until(Time.now + 5.days)).to contain_exactly(card3)
    end
    it 'scope  overbue' do
      card2.complitely_date = Time.now
      card3.date = Time.now
      card2.save
      card3.save
      expect(Card.overdue).to contain_exactly(card3)
    end
    it 'scope  overbue' do
      card2.complitely_date = Time.now
      card3.date = Time.now + 5.days
      card2.save
      card3.save
      expect(Card.overdue).to contain_exactly
    end
    it 'scope  without_due_date' do
      card3.date = Time.now
      card2.save
      card3.save
      expect(Card.without_due_date).to contain_exactly
    end
    it 'scope  without_due_date' do
      card3.date = nil
      card2.save
      card3.save
      expect(Card.without_due_date).to contain_exactly(card3)
    end
  end
  context 'Asociating' do
    it { is_expected.to belong_to(:list) }
    it { is_expected.to have_and_belong_to_many(:users) }
    it { is_expected.to have_and_belong_to_many(:labels) }
    it { is_expected.to have_many(:attachments) }
    it { is_expected.to have_many(:comments) }
  end
end
