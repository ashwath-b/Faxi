class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.integer :cab_id
      t.float :start_lat
      t.float :start_lng
      t.float :end_lat
      t.float :end_lng
      t.float :rent_amount
      t.boolean :in_progress, :default => false
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
