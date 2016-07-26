class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, :address, :email, :password, :telephone, :password, :cc_number, presence: true
  validates :email, format: { with: VALID_EMAIL_REGEX }
  validates :name, :address, :email, length: {maximum: 50}
  validates :cc_number, length: {maximum: 13}
  validates :password, length: {maximum: 15}

end
