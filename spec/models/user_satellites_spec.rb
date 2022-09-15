require 'rails_helper'

RSpec.describe UserSatellite, type: :model do

  describe 'validations' do
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :satellite_id }
  end

  describe 'relationships' do
    it { should belong_to :user }
    it { should belong_to :satellite }
  end

end