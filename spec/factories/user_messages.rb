FactoryBot.define do
  factory :user_message do
    user_id {}
    message_id {}
    user_role {}
    created_at { Faker::Time.backward(days:365) }
    updated_at { Faker::Time.backward(days:365) }
  end
end