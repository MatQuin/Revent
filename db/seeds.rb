# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create!(email:"auroraemu@gmail.com", password:"revent")

Event.create!(address:"68 avenue Parmentier", start: "20/07/2023", end: "21/07/2023", user_id: 1, title: "Soiree", status: true)
