class List < ApplicationRecord
  belongs_to :list
  validates :title, presence: true, length: { minimum: 5 }
end
