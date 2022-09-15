FactoryBot.define do
  factory :satellite do
    norad_id { Faker::Number.number(digits: 6)}
  end
end