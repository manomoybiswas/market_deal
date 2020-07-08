class Quantity < ApplicationRecord
  has_many :product_quantity, class_name: "product_quantity", foreign_key: "product_id", dependent: :destroy
  has_and_belongs_to_many :product
  has_many :cart, dependent: :destroy

  def quantity_with_unit
    "#{quantity_size} #{unit}"
  end
end
