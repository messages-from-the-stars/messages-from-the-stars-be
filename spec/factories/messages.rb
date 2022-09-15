FactoryBot.define do
  factory :message do
    satellite_id {}
    start_lat { Faker::Address.latitude }
    start_lng { Faker::Address.longitude }
    content { Faker::Quotes::Shakespeare.hamlet }
    created_at { Faker::Time.backward(days:365) }
    updated_at { Faker::Time.backward(days:365) }
  end
end