class User < ApplicationRecord
# 	VALID_EMAIL_REGIX =/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
# 	validates: name,presence: true,length: {maximum:50}
# 	validates: email,presence: true,length: {maximum: 255} ,format: {with: VALID_EMAIL_REGIX},uniqueness: {case_sensitive:false}
   before_save { self.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/is
  validates :name,  presence: true, length: { maximum: 50 }
  
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

 end
