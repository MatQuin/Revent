require "open-uri"

GuestActivity.destroy_all
Activity.destroy_all
Guest.destroy_all
Event.destroy_all
User.destroy_all

puts "create user"

user_1 = User.create!(email: 'pierre@gmail.com', password: '123456')
file = URI.open("https://avatars.githubusercontent.com/u/123462676?v=4")
user_1.avatar.attach(io: file, filename: "avatar.png", content_type: "image/png")

puts "create user"

user_3 = User.create!(email: 'matt@gmail.com', password: '123456')
file = URI.open("https://avatars.githubusercontent.com/u/123732355?v=4")
user_3.avatar.attach(io: file, filename: "avatar.png", content_type: "image/png")

puts "create user"

user_2 = User.create!(email: 'aurora@gmail.com', password: '123456')
file = URI.open("https://avatars.githubusercontent.com/u/123490989?v=4")
user_2.avatar.attach(io: file, filename: "avatar.png", content_type: "image/png")

puts "create user"

user_4 = User.create!(email: 'karim@gmail.com', password: '123456')
file = URI.open("https://avatars.githubusercontent.com/u/123788157?v=4")
user_4.avatar.attach(io: file, filename: "avatar.png", content_type: "image/png")

puts "create event"

event = Event.create!(
  title: "Aurora's Wedding",
  start: 1.week.ago,
  end: 1.week.ago + 3,
  address: 'Sassari',
  user_id: user_1.id
)

puts "create event"

event = Event.create!(
  title: "Normandie No Code Trip at the Villa San Pierro",
  start: 3.week.ago,
  end: 3.week.ago + 3,
  address: '1 Rue du Général Leclerc, 76790, Etretat',
  user_id: user_1.id
)

puts "create event"

event = Event.create!(
  title: "Chillos Party",
  start: 4.week.ago,
  end: 4.week.ago + 1,
  address: '128 rue Oberkampf, 75011, Paris',
  user_id: user_1.id
)

puts "create event"

event = Event.create!(
  title: "Fiesta",
  start: 4.week.ago,
  end: 4.week.ago + 3,
  address: '124 rue Oberkampf, 75011, Paris',
  user_id: user_1.id
)

puts "create event"

event = Event.create!(
  title: "Final Demo",
  start: 0.week.ago,
  end: 0.week.after + 1,
  address: '68 Avenue Parmentier, 75011 Paris ',
  user_id: user_1.id
)

puts "create event"

event = Event.create!(
  title: "Mystery Party",
  start: 3.week.ago + 2,
  end: 3.week.ago + 3,
  address: '62 Avenue Parmentier, 75011 Paris ',
  user_id: user_1.id
)

puts "create event"

event = Event.create!(
  title: "Granny 80's Party",
  start: 1.week.after + 2,
  end: 1.week.after + 3,
  address: '54-56 Avenue Hoche, 75008 Paris ',
  user_id: user_1.id
)
file = URI.open("https://cdn.trendhunterstatic.com/phpthumbnails/40/40884/40884_1_600.jpeg?auto=webp")
event.photo.attach(io: file, filename: "photo.jpg", content_type: "image/jpg")

puts "create guests"

guest_1 = Guest.create!(
  user_id: user_1.id,
  event_id: event.id
)

guest_3 = Guest.create!(
  user_id: user_3.id,
  event_id: event.id
)

guest_4 = Guest.create!(
  user_id: user_4.id,
  event_id: event.id
)

puts "create activity"

restaurant_activity = Activity.create!(
  description: 'Trouver un restaurant',
  start: Time.now,
  end: Time.now + 1,
  guest_id: guest_1.id,
  event_id: event.id
)
