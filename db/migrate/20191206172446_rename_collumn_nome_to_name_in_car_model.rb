class RenameCollumnNomeToNameInCarModel < ActiveRecord::Migration[5.2]
  def change
    change_table :car_models do |t|
      t.rename :nome, :name
    end

  end
end
