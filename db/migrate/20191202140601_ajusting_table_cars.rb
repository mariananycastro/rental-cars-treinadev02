class AjustingTableCars < ActiveRecord::Migration[5.2]
  def change
       change_table :cars do |t|
        t.remove :test_two, :test_4, :daily_rates
       end
  end
end
