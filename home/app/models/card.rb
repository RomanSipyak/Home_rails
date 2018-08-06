class Card < ApplicationRecord
  include TitleConcern
  belongs_to :list, touch: true
  has_and_belongs_to_many :users
  has_and_belongs_to_many :labels
  has_many :attachments, as: :file_container
  has_many :comments
  validates :title, presence: true, length: { minimum: 5, maximum: 25 }
  after_validation :corection_title
  scope :by_labels, ->(label_ids) { joins(:labels).where(labels: { id: label_ids }) }
  scope :by_assigned_users, ->(user_ids) { joins(:users).where(users: { id: user_ids }) }
  scope :by_title, ->(str) { where(arel_table[:title].matches("%#{str}%")) }
  scope :should_be_done_until, ->(datetime) { where(arel_table[:date].lt(datetime).and(arel_table[:complitely_date].eq(nil))) }
  scope :overdue, -> { should_be_done_until(Time.now) }
  scope :without_due_date, -> { where(arel_table[:date].eq(nil)) }

end
