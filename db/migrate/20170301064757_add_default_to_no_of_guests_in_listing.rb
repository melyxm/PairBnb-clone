class AddDefaultToNoOfGuestsInListing < ActiveRecord::Migration[5.0]
  def change
    change_column_default :listings, :no_of_guests, 10
  end
end
