class CreateCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :carts do |t|
      t.references :product, null: false, foreign_key: true
      t.references :quantity, null: false, foreign_key: true
      t.bigint :quantity, null: false, default: 1
      t.bigint :amount, null: false

      t.timestamps
    end
  end
end
