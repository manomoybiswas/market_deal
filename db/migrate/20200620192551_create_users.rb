class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name,            null: false,   limit: 50
      t.string :email,           null: false,   limit: 50
      t.string :mobile,          null: false,   limit: 13
      t.string :password_digest, null: false,   limit: 255
      t.boolean :admin,          default: false
      t.string :avater,          limit: 50

      t.timestamps
    end
  end
end
