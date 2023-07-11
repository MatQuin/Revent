require "open-uri"

GuestActivity.destroy_all
Activity.destroy_all
Guest.destroy_all
Event.destroy_all
User.destroy_all

puts "create user"

user_1 = User.create!(email: 'matt@gmail.com', password: '123456')
file = URI.open("https://avatars.githubusercontent.com/u/123732355?v=4")
user_1.avatar.attach(io: file, filename: "avatar.png", content_type: "image/png")

puts "create user"

user_2 = User.create!(email: 'aurora@gmail.com', password: '123456')
file = URI.open("https://avatars.githubusercontent.com/u/123490989?v=4")
user_2.avatar.attach(io: file, filename: "avatar.png", content_type: "image/png")

puts "create user"

user_3 = User.create!(email: 'pierre@gmail.com', password: '123456')
file = URI.open("https://avatars.githubusercontent.com/u/123462676?v=4")
user_3.avatar.attach(io: file, filename: "avatar.png", content_type: "image/png")

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

event = Event.create!(
  title: "Final Demo",
  start: 0.week.ago,
  end: 0.week.after + 1,
  address: '68 Avenue Parmentier, 75011 Paris ',
  user_id: user_1.id
)

event = Event.create!(
  title: "Mystery Party",
  start: 1.week.after + 2,
  end: 1.week.after + 3,
  address: '62 Avenue Parmentier, 75011 Paris ',
  user_id: user_1.id
)

puts "create guests"

guest_1 = Guest.create!(
  user_id: user_1.id,
  event_id: event.id
)

guest_2 = Guest.create!(
  user_id: user_2.id,
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

dj_activity = Activity.create!(
  description: 'DJ set',
  start: Time.now,
  end: Time.now + 1,
  guest_id: guest_1.id,
  event_id: event.id
)

puts "create propositions"

Proposition.create!(
  activity_id: dj_activity.id,
  guest_id: guest_1.id,
  description: 'play Maroon 5'
)

Proposition.create!(
  activity_id: dj_activity.id,
  guest_id: guest_1.id,
  description: 'play Michel Sardou'
)

Proposition.create!(
  activity_id: dj_activity.id,
  guest_id: guest_2.id,
  description: 'play ABBA'
)

puts "create activity"

catering_activity = Activity.create!(
  description: 'Catering',
  start: Time.now,
  end: Time.now + 2,
  guest_id: guest_1.id,
  event_id: event.id
)

puts "create propositions"

Proposition.create!(
  activity_id: catering_activity.id,
  guest_id: guest_1.id,
  description: 'petits fours'
)

Proposition.create!(
  activity_id: catering_activity.id,
  guest_id: guest_1.id,
  description: 'pièce montée'
)

Proposition.create!(
  activity_id: catering_activity.id,
  guest_id: guest_2.id,
  description: 'booze'
)

puts "create activity"

shooting_activity = Activity.create!(
  description: 'Photo shooting',
  start: Time.now,
  end: Time.now + 3,
  guest_id: guest_1.id,
  event_id: event.id
)

puts "create propositions"

Proposition.create!(
  activity_id: shooting_activity.id,
  guest_id: guest_1.id,
  description: 'on the beach'
)

Proposition.create!(
  activity_id: shooting_activity.id,
  guest_id: guest_1.id,
  description: 'on the rooftop'
)

Proposition.create!(
  activity_id: shooting_activity.id,
  guest_id: guest_2.id,
  description: 'after midnight'
)
