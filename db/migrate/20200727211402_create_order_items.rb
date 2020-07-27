class CreateOrderItems < ActiveRecord::Migration[6.0]
  def change
    create_table :order_items do |t|
      t.references :order,                null: false, foreign_key: true
      t.references :product,              null: false, foreign_key: true
      t.references :available_quantities, null: false, foreign_key: true
      t.integer    :quantity,             null: false, limit: 1
      t.numeric    :price_per_unit,       null: false, precision: 7,     scale: 2
      t.numeric    :discount,             null: false, precision: 5,     scale: 2
      t.numeric    :total_price,          null: false, precision: 10,    scale: 2

      t.timestamps
    end
  end
end
