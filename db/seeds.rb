# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rails db:seed command
# (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: 'Example User',
             email: 'example@railstutorial.org')

10.times do |n|
  name = Faker::Name.unique.name
  email = "example-#{n + 1}@railstutorial.org"
  User.create!(name: name,
               email: email)
end
Faker::Name.unique.clear

users = User.order(:created_at).take(5)
users.each do |user|
  15.times do |_i|
    title = Faker::Book.title
    description = Faker::TvShows::TheITCrowd.quote
    date = Faker::Date.between(from: 30.days.ago, to: Date.today + 30.days)
    location = Faker::Address.full_address
    user.hosting_events.create!(title: title,
                                description: description,
                                date: date,
                                location: location)
  end
end

# Attendees
users = User.all
event = users[0].hosting_events.first
attendees = users[1..-1]
attendees.each { |attendee| attendee.attend(event) }
