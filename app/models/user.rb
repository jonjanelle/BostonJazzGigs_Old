class User < ApplicationRecord
  has_one :musician
  before_save { self.email = email.downcase }
  validates_presence_of :firstname, :lastname
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                  format: { with: VALID_EMAIL_REGEX },
                  uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  validates :user_type, presence: true, length: {minimum: 1, maximum: 1}
end
