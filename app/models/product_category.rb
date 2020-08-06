class ProductCategory < ApplicationRecord
  belongs_to :product, class_name: "product", foreign_key: "product_id"
  belongs_to :category, class_name: "category", foreign_key: "category_id"
end
