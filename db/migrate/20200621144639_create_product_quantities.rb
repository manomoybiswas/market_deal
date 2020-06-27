class CreateProductQuantities < ActiveRecord::Migration[6.0]
  def change
    create_table :product_quantities do |t|
      t.references :product, null: false, foreign_key: true
      t.references :quantity, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
