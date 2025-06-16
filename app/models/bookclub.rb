class Bookclub < ApplicationRecord
  has_many :members
  has_many :users, through: :members
  belongs_to :creator, class_name: "User", foreign_key: "user_id"

  validates :name, presence: true
end
