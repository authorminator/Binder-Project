class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy

  has_many :created_bookclubs, class_name: "Bookclub", foreign_key: "user_id", dependent: :destroy
  has_many :members
  has_many :bookclubs, through: :members
end
