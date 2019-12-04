class TestingTableCars < ActiveRecord::Migration[5.2]
  #rails generate migration TestingTableCars
  def change
    add_column :cars, :daily_rates, :decimal
    change_table :cars do |t|
      t.remove :test_one #colocar sempre o tipo, para não deletar informacao errada, ou se ele tiver amarracao
      t.rename :test_3, :test_4
    end
  end
end
