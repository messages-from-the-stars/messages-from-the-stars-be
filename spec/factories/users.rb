FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    username { Faker::Internet.username }
  end
end