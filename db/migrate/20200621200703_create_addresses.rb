class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :user,           null: false,   foreign_key: true
      t.string     :address_line_1, null: false,   limit: 100
      t.string     :address_line_2, null: true,    limit: 100
      t.string     :city,           null: false,   limit: 30
      t.string     :district,       null: false,   limit: 30
      t.string     :state,          null: false,   limit: 30
      t.string     :landmark,       null: true,    limit: 50
      t.integer    :pin_code,       null: false,   limit: 6
      t.string     :type,           null: false,   limit: 10
      t.boolean    :current,        default: false
      
      t.timestamps
    end
  end
end
