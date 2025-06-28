class Profile < ApplicationRecord
  belongs_to :user
  has_many :shelves, dependent: :destroy
  has_many :owned_books, through: :shelves
end
