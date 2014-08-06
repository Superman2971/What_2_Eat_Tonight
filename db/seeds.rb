# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([
  {
  name: "Ian Goldfarb",
  email: "goldfarb.ian@gmail.com",
  phone: "541-621-0655"
  },
  {
  name: "John Cusack",
  email: "Won't tell me",
  phone: "911"
  }
  ])

comments = Comment.create([
  {
  text: "First!"
  },
  {
  text: "Second!"
  },
  {
  text: "Third!"
  }
  ])