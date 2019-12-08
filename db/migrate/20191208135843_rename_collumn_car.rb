class RenameCollumnCar < ActiveRecord::Migration[5.2]
  def change
    change_table :cars do |t|
      t.remove :integer
      t.integer :mileage
    end
  end
end
