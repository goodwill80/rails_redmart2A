class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :name, :address, :email, :telephone, :cc_number, presence: true
    before_save { self.email = email.downcase }
    validates :email, format: { with: VALID_EMAIL_REGEX },  uniqueness: { case_sensitive: false }
    validates :name, :address, :email, length: {maximum: 50}
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
end
