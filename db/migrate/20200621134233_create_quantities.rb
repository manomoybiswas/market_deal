class CreateQuantities < ActiveRecord::Migration[6.0]
  def change
    create_table :quantities do |t|
      t.bigint :quantity_size, null: false

      t.timestamps
    end
  end
end
