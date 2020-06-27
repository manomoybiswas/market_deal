class ProductCategory < ApplicationRecord

  before_validation :valid_name
  
  validates :category_name, length: { in: 3..50 }
  validates_presence_of :category_name
  validates_uniqueness_of :category_name, case_sensitive: false

  has_many :product, dependent: :destroy
  
  private
  def valid_name
    self.category_name = category_name.to_s.titleize.strip
  end
end
