class CreateProductStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :product_stocks do |t|
      t.references :product,                 null: false, foreign_key: true
      t.references :unit,                    null: false, foreign_key: true
      t.bigint     :quantity,                null: false
      t.numeric    :per_unit_purchase_price, null: false, precision: 6,  scale: 2
      t.numeric    :per_unit_retail_price,   null: false, precision: 6,  scale: 2
      t.numeric    :total_purchase_price,    null: false, precision: 10, scale: 2

      t.timestamps
    end
  end
end
