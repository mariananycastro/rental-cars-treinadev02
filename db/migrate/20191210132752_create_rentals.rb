class CreateRentals < ActiveRecord::Migration[5.2]
  def change
    create_table :rentals do |t|
      t.date :start_data
      t.date :end_date
      t.references :client, foreign_key: true
      t.references :car_category, foreign_key: true
      t.string :reservation_code

      t.timestamps
    end
  end
end
