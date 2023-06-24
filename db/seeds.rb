# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create!(email:"auroraemu@gmail.com", password:"revent")

Event.create!(
  user: User.first,
  title: 'Anniversaire de mamie',
  status: 'to_come',
  start: Date.today + 3.days,
  end: Date.today + 4.jours,
  address: '16 Villa Gaudelet'
)
