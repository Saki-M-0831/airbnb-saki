class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.integer :accommodation_id
      t.date :check_in
      t.date :check_out
      t.float :total_price

      t.timestamps
    end
  end
end
