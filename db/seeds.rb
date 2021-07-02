# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

50.times do |n| 
  user = User.new(
    name: Faker::Movies::HarryPotter.character,
    email: "email#{n+1}@email.com",
    password: "password",
    description: Faker::Movies::HarryPotter.quote
  )
  user.skip_confirmation!
  user.save
end

users = User.all
home_t = ["House", "Bed & Breakfast", "Apartment"]
room_t = ["Private", "Shared", "Entire"]

users.each do |user|
  Accommodation.create!(
    user_id: user.id,
    home_type: home_t.sample,
    room_type: room_t.sample,
    accommodate: Faker::Number.within(range: 1..4),
    bedroom_count: Faker::Number.within(range: 1..4),
    bathroom_count: Faker::Number.within(range: 1..4),
    price: Faker::Number.within(range: 50..1000),
    name: Faker::Movies::HarryPotter.location,
    summary: Faker::Movies::HarryPotter.quote,
    location: Faker::Address.full_address,
    is_active: false
  )
end
