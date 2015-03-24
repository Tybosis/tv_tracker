# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

profiles = Profile.create([
  
  {
    name: 'Kevin',
    email: 'kevin@example.com',
    address: 'something',
    city: 'seattle',
    state: 'wa',
    zip: 98155
  },

  {
    name: 'Tyler',
    email: 'tyler@example.com',
    address: 'something',
    city: 'seattle',
    state: 'wa',
    zip: 98122
  }
  ])

shows = Show.create([
  {
    name: "Big Bang Theory",
    air_time: '9pm',
    status: 'Continuing',
    next_episode: "2015-4-12",
    overview: "Follow the lives of nerds in this comedy",
    banner: 'MyString',
    poster: 'MyString'
  },


  {
    name: 'Elementary',
    air_time: '10pm',
    status: 'Continuing',
    next_episode: "2015-4-12",
    overview: "Modern day Sherlock in New York with Joan Watson",
    banner: 'MyString',
    poster: 'MyString'
  }
  ])


