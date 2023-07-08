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
  status: 'to_come',
  start: Date.today + 3,
  end: Date.today + 4,
  address: '16 Villa Gaudelet',
  user_id: user.id
)

guest = Guest.create!(
  user_id: user.id, 
  event_id: event.id
)

activity = Activity.create!(
  description: 'Courses de mamies',
  start: Date.today,
  end: Date.today + 2,
  guest_id: guest.id,
  event_id: event.id
)

activity = Activity.create!(
  description: 'Bingo',
  start: Date.today,
  end: Date.today + 3,
  guest_id: guest.id,
  event_id: event.id
)

activity = Activity.create!(
  description: 'Bataille de cannes',
  start: Date.today,
  end: Date.today + 4,
  guest_id: guest.id,
  event_id: event.id
)
