class Category < ApplicationRecord
  has_many :product_category, dependent: :destroy 
  
  before_validation :valid_name
  validates :title, length: { in: 3..50 }
  validates_presence_of :title
  validates_uniqueness_of :title, case_sensitive: false

  private
  def valid_name
    self.title = title.to_s.titleize.strip
  end
end
