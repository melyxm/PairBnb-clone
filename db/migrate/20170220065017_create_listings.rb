class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.integer :price
      t.integer :ratings
      t.integer :user_id
      t.string :about
      t.integer :bedroom
      t.integer :bathroom
      t.json    :images
      t.integer :roomtype, default: 0
      t.string :address
      t.string :title

      t.timestamps
    end
  end
end
