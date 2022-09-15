class UserMessage < ApplicationRecord

  enum user_role: [:author, :reader]

  validates :message_id, presence: true
  validates :user_id, presence: true

  belongs_to :user
  belongs_to :message

end