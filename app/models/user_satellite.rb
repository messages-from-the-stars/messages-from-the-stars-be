class UserSatellite < ApplicationRecord

  validates :user_id, presence: true
  validates :satellite_id, presence: true

  belongs_to :user
  belongs_to :satellite

end