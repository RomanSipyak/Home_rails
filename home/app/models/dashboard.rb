class Dashboard < ApplicationRecord
  include TitleConcern
  has_many :memberships
  belongs_to :user
  has_many :users, through: :memberships
  has_many :lists, dependent: :destroy
  has_many :labels
  validates :title, presence: true, length: { minimum: 5, maximum: 25 }
  validates :user, presence: true
  after_validation :corection_title
  scope :ordered_by_title, -> { order(title: :asc) }

end
