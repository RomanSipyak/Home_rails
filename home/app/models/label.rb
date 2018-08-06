class Label < ApplicationRecord
  has_and_belongs_to_many :cards
  belongs_to :dashboard
  validates :color, presence: true
end
