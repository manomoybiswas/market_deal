class AddUnitToQuantity < ActiveRecord::Migration[6.0]
  def change
    add_column :quantities, :unit, :string, null:false
  end
end
