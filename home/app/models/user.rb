class User < ApplicationRecord
  has_many :memberships
  has_many :dashboards, through: :memberships

  validates :username, :email, presence: true
  validates :password, length: { minimum: 5 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
