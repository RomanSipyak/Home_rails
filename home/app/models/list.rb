class List < ApplicationRecord
  include TitleConcern
  has_many :cards, dependent: :destroy
  belongs_to :dashboard , touch: true
  validates :title, presence: true, length: { minimum: 5, maximum: 25}
end
