class CreateProductCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :product_categories do |t|
      t.string :category_name, null: false, limit: 50
      t.text :category_description

      t.timestamps
    end
  end
end
