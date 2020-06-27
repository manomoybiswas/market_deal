class ProductQuantity < ApplicationRecord
  belongs_to :product, class_name: "product", foreign_key: "product_id"
  belongs_to :quantity, class_name: "quantity", foreign_key: "quantity_id"
end
