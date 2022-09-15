require 'rails_helper'

describe 'user_satellite api' do

  it 'creates a new user_satellite instance if both user and satellite exist' do

    sat_1 = FactoryBot.create(:satellite)
    user_1 = FactoryBot.create(:user)

    expect(Satellite.all.count).to eq(1)
    expect(UserSatellite.all.count).to eq(0)

    post "/api/v1/user_satellite/create_user_satellite?user_id=#{user_1.id}&norad_id=#{sat_1.norad_id}"

    expect(response).to be_successful

    expect(Satellite.all.count).to eq(1)
    expect(UserSatellite.all.count).to eq(1)
  end

  it 'creates a new user_satellite instance with a new satellite if it does not already exist' do
    user_1 = FactoryBot.create(:user)

    expect(Satellite.all.count).to eq(0)
    expect(UserSatellite.all.count).to eq(0)

    post "/api/v1/user_satellite/create_user_satellite?user_id=#{user_1.id}&norad_id=9999999"

    expect(response).to be_successful

    expect(Satellite.all.count).to eq(1)
    expect(UserSatellite.all.count).to eq(1)
  end

  it 'returns an error if user_id is not present' do
    
    post "/api/v1/user_satellite/create_user_satellite?norad_id=99999"

    expect(response).to_not be_successful
  end

  it 'returns an error if norad_id is not present' do
    
    post "/api/v1/user_satellite/create_user_satellite?user_id=99999"

    expect(response).to_not be_successful
  end

end