class User < ApplicationRecord
  has_secure_password
  # has_many :tasks, foreign_key: "assign_task_to", dependent: :destroy
  # has_many :notifications, foreign_key: "user_id"
  
  # mount_uploader :avater, AvaterUploader
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  VALID_MOBILE_REGEX=/\A[6-9][0-9]{9}\z/.freeze

  before_validation :valid_name
  before_validation :valid_email

  validates :name, length: { in: 3..50 }
  validates :email, format: { with: VALID_EMAIL_REGEX }
  validates :mobile, length: {is: 10}, format: { with: VALID_MOBILE_REGEX }
  validates :password, length: { minimum: 5 }
  validates_presence_of :name, :email, :mobile
  validates_uniqueness_of :email, :mobile, case_sensitive: true

  private

  def valid_name
    self.name = name.to_s.titleize.strip
  end

  def valid_email
    self.email = email.to_s.downcase.strip
  end
end
