class ChangeNameStartDataToStartDateOnRental < ActiveRecord::Migration[5.2]
  def change
    change_table :rentals do |t|
      t.rename :start_data, :start_date
    end
  end
end
