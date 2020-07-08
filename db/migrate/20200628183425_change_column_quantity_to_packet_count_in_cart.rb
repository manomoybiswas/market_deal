class ChangeColumnQuantityToPacketCountInCart < ActiveRecord::Migration[6.0]
  def change
    remove_column :carts, :quantity
    add_column :carts, :packet_count, :bigint, null: false
  end
end
