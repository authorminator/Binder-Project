class CreateOwnedBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :owned_books do |t|
      t.integer :rating
      t.references :shelf, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
