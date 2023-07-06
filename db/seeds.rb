# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# User.create!(email:"auroraemu@gmail.com", password:"revent")
require "open-uri"

GuestActivity.destroy_all
Activity.destroy_all
Guest.destroy_all
Event.destroy_all
User.destroy_all

user1 = User.new(
  email: 'totouuuu@gmail.com',
  password: 'tototo1'
)


file = URI.open("https://avatars.githubusercontent.com/u/123788157?v=4")
user1.avatar.attach(io: file, filename: "avatar.png", content_type: "image/png")

user1.save
user1.valid?

event1 = Event.new(
  title: 'Anniversaire de mamie',
  status: 'to_come',
  start: Date.today + 3,
  end: Date.today + 4,
  address: '16 Villa Gaudelet'
)

event1.user = user1
event1.save

# Event.create!(address:"68 avenue Parmentier", start: "20/07/2023", end: "21/07/2023", user_id: 1, title: "Soiree", status: true)
# Event.create!(address:"67 avenue Parmentier", start: "21/07/2023", end: "22/07/2023", user_id: "1", title: "Soiree", status: true)


guest1 = Guest.new()
guest1.user = user1
guest1.event = event1

guest1.save

activity1 = Activity.new(
  description: 'EVG de Ken',
  start: Date.today,
  end: Date.today + 2
)

activity1.guest = guest1
activity1.event = event1
activity1.save
