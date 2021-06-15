class CreateAccommodations < ActiveRecord::Migration[5.2]
  def change
    create_table :accommodations do |t|
      t.integer :user_id
      t.string :home_type
      t.string :room_type
      t.integer :accommodate
      t.integer :bedroom_count
      t.integer :bathroom_count
      t.float :price
      t.string :name
      t.text :summary
      t.boolean :has_tv
      t.boolean :has_kitchen
      t.boolean :has_internet
      t.boolean :has_heating
      t.boolean :has_ac
      t.string :location
      t.boolean :is_active

      t.timestamps
    end
  end
end
