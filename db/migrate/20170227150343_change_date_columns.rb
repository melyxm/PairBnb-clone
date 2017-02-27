class ChangeDateColumns < ActiveRecord::Migration[5.0]
  def change
    remove_column :reservations, :check_in, :integer
    remove_column :reservations, :check_out, :integer
    add_column :reservations, :check_in, :date
    add_column :reservations, :check_out, :date
  end
end
