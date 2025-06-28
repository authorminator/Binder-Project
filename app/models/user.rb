class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy
  has_many :shelves, through: :profile
  has_many :owned_books, through: :shelves
end


# Comment by Rayz

# Things to consider in future:
# 1. dependent: :destroy - needed or not?
# 2. owned_books association - belongs_to :shelf in addition to :user, or belongs_to :shelf only?
