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

def reset_db
  # Remove all data from the database
  Book.destroy_all
  OwnedBook.destroy_all
  Shelf.destroy_all
  Profile.destroy_all
  User.destroy_all
end

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
    {title: "The Great Gatsby"},
    {title: "The Catcher in the Rye"},
    {title: "Nineteen Eighty Four"},
    {title: "To Kill a Mockingbird"},
    {title: "Heart of Darkness"},
    {title: "The Divine Comedy"},
    {title: "The Little Prince"},
    ]

  books.each do |book|
    Book.create!(
      title: book[:title]
    )
  end
end

def create_profiles
  users = User.all

  users.each do |user|
    Profile.create!(
      user: user
    )
  end
end
def create_shelves
  profiles = Profile.all

  profiles.each do |profile|
    Shelf.create!(
      profile: profile
    )
  end
end

def create_owned_books
  shelves = Shelf.all
  books = Book.all

  # Add title a Description

  shelves.each do |shelf|
    # Choose 5 random and unique books
    random_books = books.sample(5)
    random_books.each do |book|
      OwnedBook.create!(
        shelf: shelf,
        book: book
      )
    end
  end
end

def seed_database
  # The following functions must be called in this order
  create_users
  create_books
  create_profiles
  create_shelves
  create_owned_books
end

puts "Removing old data"
reset_db
puts "Data removed"
puts "Seeding database"
seed_database
puts "Seeding Finished"
