class Product < ApplicationRecord
  belongs_to :product_category
  has_many :product_picture, class_name: "ProductPicture", dependent: :destroy
  has_many :product_quantity, dependent: :destroy
  has_many :quantity, dependent: :destroy
  has_and_belongs_to_many :cart, dependent: :destroy
  validates_presence_of :product_name, :product_unit, :product_description, :price
  validates :product_unit, inclusion: %w[Packet kg gram ltr. ml. bundle]
end
