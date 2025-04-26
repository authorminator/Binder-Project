class Profile < ApplicationRecord
  belongs_to :user
  has_many :shelfs, dependent: :destroy
end
