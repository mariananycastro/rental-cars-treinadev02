class ChangeTableCars < ActiveRecord::Migration[5.2]
  #rails generate migration ChangeTableCars
  def change
      add_column :cars, :car_insurance, :decimal
      add_column :cars, :third_party_insurance, :decimal
      add_column :cars, :test_one, :string
      add_column :cars, :test_two, :string
      add_column :cars, :test_3, :string
  end
end
