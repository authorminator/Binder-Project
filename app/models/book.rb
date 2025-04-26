class Book < ApplicationRecord
  has_many :owned_books, dependent: :destroy
end
