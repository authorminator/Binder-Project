require 'faker'
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

def create_users

  users = [
    {email: "cindy@cindy.com", password: "123456"},
    {email: "allan@allan.com", password: "123456"},
    {email: "rayz@rayz.com", password: "123456"},
    {email: "sarah@sarah.com", password: "123456"},
    {email: "minami@minami.com", password: "123456"},
    {email: "nico@nico.com", password: "123456"},
  ]

  users.each do |user|
    User.create!(
      email: user[:email],
      password: user[:password]
    )
  end
end

def create_books

  books = [
    {title: "Harry Potter and the Philosopher's Stone"},
    {title: "The Lord of the Rings"},
    {title: "Ancillary Justice"},
    {title: "The Phantom Tollbooth"},
    {title: "Leviathan Wakes"},
    {title: "The Count of Monte Cristo"},
  ]

  books.each do |book|
    Book.create!(
      title: book[:title]
    )
  end
end
