class OwnedBook < ApplicationRecord
  belongs_to :shelf
  belongs_to :book

  validates :reviews, length: { maximum: 500 }, allow_blank: true
  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }, allow_blank: true
end
