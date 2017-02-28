class AddRoomsToReservations < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :rooms, :integer
  end
end
