class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :product_name, null: false, linit: 50
      t.references :product_category, null: false, foreign_key: true
      t.bigint :price, null: false

      t.timestamps
    end
  end
end
