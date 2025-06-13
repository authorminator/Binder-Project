class CreateBookclubs < ActiveRecord::Migration[7.1]
  def change
    create_table :bookclubs do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
