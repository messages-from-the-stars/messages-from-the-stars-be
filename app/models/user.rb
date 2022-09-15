class User < ApplicationRecord

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true

  has_many :user_messages
  has_many :messages, through: :user_messages

end