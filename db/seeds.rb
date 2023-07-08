require "open-uri"

Activity.destroy_all
Guest.destroy_all
Event.destroy_all
User.destroy_all

user = User.create!(email: 'matt@gmail.com', password: '123456')

file = URI.open("https://avatars.githubusercontent.com/u/123732355?v=4")
user.avatar.attach(io: file, filename: "avatar.png", content_type: "image/png")

event = Event.create!(
  title: 'Anniversaire de mamie',
  start: 1.week.ago,
  end: 1.week.ago + 3.days,
  address: '16 Villa Gaudelet',
  user_id: user.id
)

guest = Guest.create!(
  user_id: user.id, 
  event_id: event.id
)

activity = Activity.create!(
  description: 'Courses de mamies',
  start: 1.week.ago,
  end: 1.week.ago + 1.day,
  guest_id: guest.id,
  event_id: event.id
)

activity = Activity.create!(
  description: 'Bingo',
  start: 1.week.ago,
  end: 1.week.ago + 2.day,
  guest_id: guest.id,
  event_id: event.id
)

activity = Activity.create!(
  description: 'Bataille de cannes',
  start: 1.week.ago,
  end: 1.week.ago + 3.day,
  guest_id: guest.id,
  event_id: event.id
)
