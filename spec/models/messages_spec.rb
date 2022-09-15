require 'rails_helper'

RSpec.describe Message, type: :model do

  describe 'validations' do
    it { should validate_presence_of :satellite_id }
    it { should validate_presence_of :start_lat }
    it { should validate_presence_of :start_lng }
    it { should validate_presence_of :content }
  end

  describe 'relationships' do
    it { should have_many :user_messages }
    it { should have_many(:users).through(:user_messages)}
    it { should belong_to :satellite }
  end

end