class User < ApplicationRecord
  include ImageUploader[:image]
  has_many :memberships
  has_many :dashboards, through: :memberships, dependent: :nullify
  has_and_belongs_to_many :cards
  scope :by_username, ->(str) { where(arel_table[:username].matches("%#{str}%")) }
  validates :username, :email, presence: true
  validates :password, length: { minimum: 5, maximum: 15}
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
