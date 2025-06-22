class OwnedBook < ApplicationRecord
  belongs_to :shelf
  belongs_to :book

  validates :rating, inclusion: { in: 1..5 }, allow_nil: true


end
