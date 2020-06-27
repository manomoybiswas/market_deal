class ProductPicture < ApplicationRecord
  belongs_to :product, class_name: "product", foreign_key: "product_id"
end
