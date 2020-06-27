class CreateProductPictures < ActiveRecord::Migration[6.0]
  def change
    create_table :product_pictures do |t|
      t.references :product, null: false, foreign_key: true
      t.string :picture

      t.timestamps
    end
  end
end
