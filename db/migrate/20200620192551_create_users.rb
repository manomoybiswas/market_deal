class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string  :name,            null: false,   limit: 50
      t.string  :username,        null: false,   linit: 30
      t.string  :email,           null: false,   limit: 50
      t.string  :mobile,          null: false,   limit: 13
      t.string  :alt_mobile,      null: true,    limit: 13
      t.string  :password_digest, null: false,   limit: 255
      t.string  :auth_type,       null: false,   limit: 50
      t.bigint  :uid,             null: true
      t.boolean :vendor,          default: false
      t.boolean :admin,           default: false
      t.string  :profile_name,    null: true,    limit: 35
      t.string  :avater,          limit: 50
      t.timestamps
    end
  end
end
