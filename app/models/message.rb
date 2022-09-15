class Message < ApplicationRecord

  validates :satellite_id, presence: true
  validates :start_lat, presence: true
  validates :start_lng, presence: true
  validates :content, presence: true

  has_many :user_messages
  has_many :users, through: :user_messages

  belongs_to :satellite

  def self.find_by_sat_id(sat_id)
    where("satellite_id = ?", sat_id).order(created_at: :desc)
  end
end