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

  describe 'methods' do
    it 'returns all messages associated with a given satellite id' do
      sat_1 = FactoryBot.create(:satellite)
        sat_1_mes_1 = FactoryBot.create(:message, satellite_id: sat_1.id)
        sat_1_mes_2 = FactoryBot.create(:message, satellite_id: sat_1.id)
        sat_1_mes_3 = FactoryBot.create(:message, satellite_id: sat_1.id)
      sat_2 = FactoryBot.create(:satellite)
        sat_2_mes_1 = FactoryBot.create(:message, satellite_id: sat_2.id)

      messages = Message.find_by_sat_id(sat_1.id)

      expect(messages.count).to eq(3)
    end
  end

end