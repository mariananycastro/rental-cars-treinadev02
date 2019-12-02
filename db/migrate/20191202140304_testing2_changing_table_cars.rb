class Testing2ChangingTableCars < ActiveRecord::Migration[5.2]
  #rails generate migration Testing2ChangingTableCars
  def change
    change_column :cars, :test_two, :decimal
  end
end
