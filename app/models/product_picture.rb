class ProductPicture < ApplicationRecord
  belongs_to :product, class_name: "Product", foreign_key: "product_id"

  mount_uploader :picture, ProductPictureUploader
end
