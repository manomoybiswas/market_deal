class AddProductDescriptionToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :product_description, :text, null: false
    add_column :products, :product_type, :string, null: false, limit: 20
  end
end
