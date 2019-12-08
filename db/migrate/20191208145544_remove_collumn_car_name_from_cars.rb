class RemoveCollumnCarNameFromCars < ActiveRecord::Migration[5.2]
  def change
    change_table :cars do |t|
      t.remove :name
    end

  end
end
