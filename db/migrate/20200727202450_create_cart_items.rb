class CreateCartItems < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_items do |t|
      t.references :cart,                 null: false, foreign_key: true
      t.references :product,              null: false, foreign_key: true
      t.references :available_quantities, null: false, foreign_key: true
      t.integer    :quantity,             null: false, limit: 1
      t.numeric    :discount,             null: false, precision: 5, scale: 2
      t.boolean    :active,               default: true
      
      t.timestamps
    end
  end
end
