class Dashboard < ApplicationRecord
  has_many :memberships
  belongs_to :user
  has_many :users, through: :memberships
  has_many :lists

  validates :title, presence: true, length: { minimum: 5 }
  validates :user, presence: true
end
