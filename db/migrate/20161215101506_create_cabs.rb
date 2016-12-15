class CreateCabs < ActiveRecord::Migration
  def change
    create_table :cabs do |t|
      t.boolean :pink_taxi, :default => false
      t.float :longitude
      t.float :latitude
      t.boolean :currently_booked, :default => false
      t.string :city
      t.text :address
      t.string :plate_num
      t.string :model

      t.timestamps
    end
  end
end
