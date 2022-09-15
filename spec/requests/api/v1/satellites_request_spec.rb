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

end