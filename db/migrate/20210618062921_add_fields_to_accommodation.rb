class AddFieldsToAccommodation < ActiveRecord::Migration[5.2]
  def change
    add_column :accommodations, :latitude, :float
    add_column :accommodations, :longitude, :float
  end
end
