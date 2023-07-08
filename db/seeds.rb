require "open-uri"

GuestActivity.destroy_all
Activity.destroy_all
Guest.destroy_all
Event.destroy_all
User.destroy_all

user_1 = User.create!(email: 'matt@gmail.com', password: '123456')
file = URI.open("https://avatars.githubusercontent.com/u/123732355?v=4")
user_1.avatar.attach(io: file, filename: "avatar.png", content_type: "image/png")

user_2 = User.create!(email: 'aurora@gmail.com', password: '123456')
file = URI.open("https://avatars.githubusercontent.com/u/123490989?v=4")
user_2.avatar.attach(io: file, filename: "avatar.png", content_type: "image/png")

event = Event.create!(
  title: "Aurora's Wedding",
  start: 1.week.ago,
  end: 1.week.ago + 3.days,
  address: 'Sassari',
  user_id: user_1.id
)

guest_1 = Guest.create!(
  user_id: user_1.id, 
  event_id: event.id
)

guest_2 = Guest.create!(
  user_id: user_2.id, 
  event_id: event.id
)

dj_activity = Activity.create!(
  description: 'DJ set',
  start: 1.week.ago,
  end: 1.week.ago + 1.day,
  guest_id: user_1.id,
  event_id: event.id
)

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

catering_activity = Activity.create!(
  description: 'Catering',
  start: 1.week.ago,
  end: 1.week.ago + 2.day,
  guest_id: user_1.id,
  event_id: event.id
)

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

shooting_activity = Activity.create!(
  description: 'Photo shooting',
  start: 1.week.ago,
  end: 1.week.ago + 3.day,
  guest_id: user_1.id,
  event_id: event.id
)

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
