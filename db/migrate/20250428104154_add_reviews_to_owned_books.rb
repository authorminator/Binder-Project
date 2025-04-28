class AddReviewsToOwnedBooks < ActiveRecord::Migration[7.1]
  def change
    add_column :owned_books, :reviews, :text
  end
end
