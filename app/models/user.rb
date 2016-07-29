class User < ApplicationRecord

has_many :microposts, dependent: :destroy
before_save { email.downcase! }

VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

 validates :name,
           presence: true,
           length: { maximum: 50, message: 'Too long yow' }

 validates :email,
           presence: true,
           length: { maximum: 50 },
           format: { with: VALID_EMAIL_REGEX },
           uniqueness: { case_sensitive: false }


 # FOR HASHING PASSWORD
 has_secure_password
 validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

 def User.digest(string)
     cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                   BCrypt::Engine.cost
     BCrypt::Password.create(string, cost: cost)
   end

   # Returns a random token.
   def User.new_token
     SecureRandom.urlsafe_base64
   end

   def feed
    Micropost.where("user_id = ?", id)
  end

end
