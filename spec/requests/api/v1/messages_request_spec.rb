require 'rails_helper'

describe 'Messages API' do

  it 'can return one message by ID' do
    sat_1 = FactoryBot.create(:satellite)
      sat_1_mes_1 = FactoryBot.create(:message, satellite_id: sat_1.id, created_at: DateTime.parse("19th May, 2000"))
      sat_1_mes_2 = FactoryBot.create(:message, satellite_id: sat_1.id, created_at: DateTime.parse("30th December, 2021"))
      sat_1_mes_3 = FactoryBot.create(:message, satellite_id: sat_1.id, created_at: DateTime.parse("20th March, 1920"))

    get "/api/v1/messages/#{sat_1_mes_2.id}"

    expect(response).to be_successful

    message = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(message).to have_key(:id)
    expect(message[:id].to_i).to eq(sat_1_mes_2.id)

    expect(message).to have_key(:type)
    expect(message[:type]).to eq("message")

    expect(message).to have_key(:attributes)

    expect(message[:attributes]).to have_key(:satellite_id)
    expect(message[:attributes][:satellite_id]).to eq(sat_1_mes_2.satellite_id)

    expect(message[:attributes]).to have_key(:start_lat)
    expect(message[:attributes][:start_lat]).to eq(sat_1_mes_2.start_lat)

    expect(message[:attributes]).to have_key(:start_lng)
    expect(message[:attributes][:start_lng]).to eq(sat_1_mes_2.start_lng)

    expect(message[:attributes]).to have_key(:content)
    expect(message[:attributes][:content]).to eq(sat_1_mes_2.content)
  end

  it 'can return all messages associated with a given satellite ID' do

    sat_1 = FactoryBot.create(:satellite)
      sat_1_mes_1 = FactoryBot.create(:message, satellite_id: sat_1.id, created_at: DateTime.parse("19th May, 2000"))
      sat_1_mes_2 = FactoryBot.create(:message, satellite_id: sat_1.id, created_at: DateTime.parse("30th December, 2021"))
      sat_1_mes_3 = FactoryBot.create(:message, satellite_id: sat_1.id, created_at: DateTime.parse("20th March, 1920"))
    sat_2 = FactoryBot.create(:satellite)
      sat_2_mes_1 = FactoryBot.create(:message, satellite_id: sat_2.id)
      sat_2_mes_2 = FactoryBot.create(:message, satellite_id: sat_2.id)
    sat_3 = FactoryBot.create(:satellite)
      sat_3_mes_1 = FactoryBot.create(:message, satellite_id: sat_3.id)

    get "/api/v1/messages/find_by_sat_id?sat_id=#{sat_1.id}"

    expect(response).to be_successful

    messages = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(messages[0][:id].to_i).to eq(sat_1_mes_2.id)
    expect(messages[1][:id].to_i).to eq(sat_1_mes_1.id)
    expect(messages[2][:id].to_i).to eq(sat_1_mes_3.id)

    messages.each do |message|
      expect(message).to have_key(:id)
      expect(message[:id].to_i).to be_an(Integer)

      expect(message).to have_key(:type)
      expect(message[:type]).to eq("message")

      expect(message).to have_key(:attributes)

      expect(message[:attributes]).to have_key(:satellite_id)
      expect(message[:attributes][:satellite_id]).to be_an(Integer)

      expect(message[:attributes]).to have_key(:start_lat)
      expect(message[:attributes][:start_lat]).to be_a(Float)

      expect(message[:attributes]).to have_key(:start_lng)
      expect(message[:attributes][:start_lng]).to be_a(Float)

      expect(message[:attributes]).to have_key(:content)
      expect(message[:attributes][:content]).to be_a(String)

      expect(message[:attributes]).to have_key(:created_at)
      expect(message[:attributes][:created_at]).to be_a(String)

      expect(message[:attributes]).to have_key(:updated_at)
      expect(message[:attributes][:updated_at]).to be_a(String)
    end
  end

  it 'can create a new message' do
    sat_1 = FactoryBot.create(:satellite)

    message_params = ({
      satellite_id: sat_1.id,
      start_lat: 77.654,
      start_lng: 12.123,
      content: "Hello i am a satellite."
    })

    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/messages/", headers: headers, params: JSON.generate(message: message_params)

    created_message = Message.last

    expect(response).to be_successful

    expect(created_message.satellite_id).to eq(sat_1.id)
    expect(created_message.start_lat).to eq(77.654)
    expect(created_message.start_lng).to eq(12.123)
    expect(created_message.content).to eq("Hello i am a satellite.")
  end

  it 'returns an error if message is not created' do
    sat_1 = FactoryBot.create(:satellite)

    message_params = ({
      satellite_id: sat_1.id,
      start_lat: 77.654,
      content: "Hello i am a satellite."
    })

    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/messages/", headers: headers, params: JSON.generate(message: message_params)

    expect(response).to_not be_successful
  end

end