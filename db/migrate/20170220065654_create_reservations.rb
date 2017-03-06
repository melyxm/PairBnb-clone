class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.integer :listing_id
      t.integer :user_id
      t.integer :check_in
      t.integer :check_out
      t.integer :no_of_guests

      t.timestamps
    end
  end
end
