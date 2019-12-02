class ChangeTableCarsAndAddCarCategories < ActiveRecord::Migration[5.2]
  def change
    change_table :car_categories do |t|
      t.string :name
      t.decimal :daily_rate
      t.decimal :car_insurance
      t.decimal :third_party_insurance
    end
   
    change_table :cars do |t|
      t.belongs_to :car_category
      t.remove :daily_rate, :car_insurance, :third_party_insurance
    end

  end
end
