class AddColumnToCars < ActiveRecord::Migration[5.2]
  # rails generate migration AddColumnToCars daily_rate:decimal 
  def change
    add_column :cars, :daily_rate, :decimal
  end

end
