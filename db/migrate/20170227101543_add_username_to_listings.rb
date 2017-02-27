class AddUsernameToListings < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :username, :string
  end
end
