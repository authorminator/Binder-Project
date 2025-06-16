class Member < ApplicationRecord
  belongs_to :bookclub, dependent: :destroy
  belongs_to :user
end
