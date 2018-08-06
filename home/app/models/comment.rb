class Comment < ApplicationRecord
  belongs_to :card, counter_cache: true
  has_one :attachment, as: :file_container
  validates :card_id, presence: true
end
