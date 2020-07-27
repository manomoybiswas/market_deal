class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.references :user,             null: false, foreign_key: true
      t.references :unit,             null: false, foreign_key: true
      t.string     :title,            null: false, linit: 50
      t.string     :summary,          null: false, limit: 255
      t.string     :type,             null: false
      t.bigint     :total_quantity,   null: false
      t.text       :content,          null: true

      t.timestamps
    end
  end
end
