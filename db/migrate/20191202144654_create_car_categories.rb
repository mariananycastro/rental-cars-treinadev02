class CreateCarCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :car_categories do |t|

      t.timestamps
    end
  end
end
