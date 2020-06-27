class Product < ApplicationRecord
  belongs_to :product_category
  has_many :product_picture, class_name: "product_picture", foreign_key: "product_id", dependent: :destroy
  has_many :product_quantity, class_name: "product_quantity", foreign_key: "product_id", dependent: :destroy
  has_many :quantities, dependent: :destroy
end