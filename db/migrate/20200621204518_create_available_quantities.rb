class CreateAvailableQuantities < ActiveRecord::Migration[6.0]
  def change
    create_table :available_quantities do |t|
      t.references :product,          null: false, foreign_key: true
      t.references :unit,             null: false, foreign_key: true
      t.integer    :packet_size,      null: false
      t.integer    :avaiable_quantity,         null: false
      t.integer    :discount_percent, null: false
      t.numeric    :discount_amount,  null: false, precision: 5, scale: 2
      t.numeric    :retail_price,     null: false, precision: 7, scale: 2
      
      t.timestamps
    end
  end
end
