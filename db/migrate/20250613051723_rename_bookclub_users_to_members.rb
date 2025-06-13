class RenameBookclubUsersToMembers < ActiveRecord::Migration[7.1]
  def change
    rename_table :bookclub_users, :members
  end
end
