class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :title,                null: false, limit: 50
      t.text   :category_description, null: true,  limit: 255
      t.timestamps
    end
  end
end
