class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.integer :total_price
      t.integer :reservation_id
      t.integer :user_id
      t.boolean :confirmation
      
      t.timestamps
    end
  end
end
