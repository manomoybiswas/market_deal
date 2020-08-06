class Product < ApplicationRecord
  belongs_to :category
  has_many :product_picture, class_name: "ProductPicture", dependent: :destroy
  has_many :available_quantity, dependent: :destroy
  has_many :product_stock, dependent: :destroy
  belongs_to :cart

  validates_presence_of :product_name, :product_unit, :product_description, :price
  validates :product_unit, inclusion: %w[Packet kg gram ltr. ml. bundle]
  
  accepts_nested_attributes_for :available_quantity, reject_if: :all_blank, allow_destroy: true
end
