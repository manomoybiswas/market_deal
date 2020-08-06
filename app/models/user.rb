class User < ApplicationRecord
  has_secure_password
  has_many :product, dependent: :destroy
  has_many :order, dependent: :destroy
  has_one :cart, dependent: :destroy
  has_many :delivary_address, dependent: :destroy
  has_many :addres, dependent: :destroy

  mount_uploader :avater, AvaterUploader
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  VALID_MOBILE_REGEX=/\A[6-9][0-9]{9}\z/.freeze

  before_validation :valid_name
  before_validation :valid_email

  validates :name, length: { in: 3..50 }
  validates :email, format: { with: VALID_EMAIL_REGEX }
  validates :username, length: { in: 3..30 }
  validates :mobile, length: {is: 10}, format: { with: VALID_MOBILE_REGEX }
  validates :password, length: { minimum: 6 }
  validates_presence_of :name, :email, :mobile, :username
  validates_uniqueness_of :email, :mobile, :username, case_sensitive: true

  private

  def valid_name
    self.name = name.to_s.titleize.strip
  end

  def valid_email
    self.email = email.to_s.downcase.strip
  end
end
