class ChangeProductTypeToProductUnit < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :product_type
    add_column :products, :product_unit, :string, null: false, linit: 20
  end
end
