class Category < ApplicationRecord
  before_validation :valid_name

  validates :title, length: { in: 3..50 }
  validates_presence_of :title
  validates_uniqueness_of :title, case_sensitive: false

  has_many :product, dependent: :destroy
  
  private
  def valid_name
    self.title = title.to_s.titleize.strip
  end
end
