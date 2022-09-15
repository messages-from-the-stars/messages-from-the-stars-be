class Satellite < ApplicationRecord

  validates :norad_id, presence: true, uniqueness: true

  has_many :messages
  has_many :user_satellites
  has_many :users, through: :user_satellites

end