class AddNoOfGuestsToListings < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :no_of_guests, :integer
  end
end
