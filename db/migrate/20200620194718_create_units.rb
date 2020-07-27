class CreateUnits < ActiveRecord::Migration[6.0]
  def change
    create_table :units do |t|
      t.string :title,   null: false, limit: 10
      t.string :summary, null: false, limit: 255

      t.timestamps
    end
  end
end
