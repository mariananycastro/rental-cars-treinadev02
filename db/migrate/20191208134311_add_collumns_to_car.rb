class AddCollumnsToCar < ActiveRecord::Migration[5.2]
  def change
    change_table :cars do |t|
      t.remove :car_category_id, :integer
      t.references :car_model, foreign_key: true
      t.references :subsidiary, foreign_key: true
      t.string :licence_plate
      t.string :color
      t.integer :integer
    end
  end
end
