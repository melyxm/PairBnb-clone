class AddRoomtypeToListings < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :roomtype, :integer, default: 0
  end
end
