class AddProductToQuantity < ActiveRecord::Migration[6.0]
  def change
    add_reference :quantities, :product, null: false, foreign_key: true
  end
end
