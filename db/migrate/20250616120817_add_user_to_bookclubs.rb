class AddUserToBookclubs < ActiveRecord::Migration[7.1]
  def change
    add_reference :bookclubs, :user, null: false, foreign_key: true
  end
end
