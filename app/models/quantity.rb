class Quantity < ApplicationRecord
  has_many :product_quantity, class_name: "product_quantity", foreign_key: "product_id", dependent: :destroy
  belongs_to :product
end
