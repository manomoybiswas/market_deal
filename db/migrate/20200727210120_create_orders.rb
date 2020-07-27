class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user,             null: false, foreign_key: true
      t.numeric    :sub_total,        null: false, precision: 10,    scale: 2
      t.integer    :discount_percent, null: false, limit: 3
      t.numeric    :discount_amount,  null: false, precision: 5,     scale: 2
      t.numeric    :gst_tax,          null: false, precision: 5,     scale: 2
      t.numeric    :shipping_charge,  null: false, precision: 4,     scale: 2
      t.numeric    :total,            null: false, precision: 10,    scale: 2
      t.string     :promocode,        null: true,  limit: 14
      t.numeric    :promo_discount,   null: true,  precision: 5,     scale: 2
      t.numeric    :grand_total,      null: false, precision: 10,    scale: 2
      t.string     :status,           null: false, limit: 15

      t.timestamps
    end
  end
end
