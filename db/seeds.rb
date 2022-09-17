# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

include FactoryBot::Syntax::Methods

@user_authors = []
@user_readers = []
@satellites = []
@messages = []
@user_messages = []
@user_satellites = []

20.times do
  @user_authors << FactoryBot.create(:user)
end

20.times do
  @user_readers << FactoryBot.create(:user)
end

CSV.foreach(Rails.root.join('lib/brightest_sat_ids.csv'), headers: true) do |row|
  @satellites << Satellite.create(norad_id: row[0])
end

50.times do
  @messages << FactoryBot.create(:message, satellite_id: @satellites.sample.id)
end

@messages.each do |message|
  @user_messages << FactoryBot.create(:user_message, user_id: @user_authors.sample.id, message_id: message.id, user_role: 0)
  @user_messages << FactoryBot.create(:user_message, user_id: @user_readers.sample.id, message_id: message.id, user_role: 1)
end

@satellites.each do |satellite|
  @user_satellites << FactoryBot.create(:user_satellite, user_id: [@user_authors.sample.id,@user_readers.sample.id].sample, satellite_id: @satellites.sample.id)
end