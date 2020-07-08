class Cart < ApplicationRecord
  has_and_belongs_to_many :product
  has_and_belongs_to_many :quantity
  belongs_to :user
end
