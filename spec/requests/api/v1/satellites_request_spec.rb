require 'rails_helper'

describe 'Satellites API' do
  it 'can return one satellite by id' do
    sat_1 = FactoryBot.create(:satellite)
    sat_2 = FactoryBot.create(:satellite)
    sat_3 = FactoryBot.create(:satellite)

    get "/api/v1/satellites/#{sat_1.id}"

    expect(response).to be_successful

    satellite = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(satellite).to have_key(:id)
    expect(satellite[:id].to_i).to eq(sat_1.id)

    expect(satellite[:attributes]).to have_key(:norad_id)
    expect(satellite[:attributes][:norad_id]).to eq(sat_1.norad_id)
  end

  it 'can return all satellites associated with user' do
    user1 = FactoryBot.create(:user)
    sat_1 = FactoryBot.create(:satellite)
    sat_2 = FactoryBot.create(:satellite)
    sat_3 = FactoryBot.create(:satellite)
    user_sat1 = FactoryBot.create(:user_satellite, user_id: user1.id, satellite_id: sat_1.id)
    user_sat2 = FactoryBot.create(:user_satellite, user_id: user1.id, satellite_id: sat_2.id)
    user_sat3 = FactoryBot.create(:user_satellite, user_id: user1.id, satellite_id: sat_3.id)

    get "/api/v1/satellites/find_by_user_id?user_id=#{user1.id}"

    expect(response).to be_successful

    user_satellites = JSON.parse(response.body, symbolize_names: true)

    expect(user_satellites[:data].count).to eq(3)

    user_satellites[:data].each do |satellite|
      expect(satellite).to have_key(:id)
      expect(satellite[:id]).to be_a(String)

      expect(satellite).to have_key(:type)
      expect(satellite[:type]).to be_a(String)

      expect(satellite[:attributes]).to have_key(:norad_id)
      expect(satellite[:attributes][:norad_id]).to be_a(Integer)
    end
  end
end