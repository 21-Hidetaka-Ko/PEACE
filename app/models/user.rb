class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  validates :sex, presence: true
  validates :major, presence: true
  validates :birthday, presence: true
  validates :university, presence: true
  validates :national, presence: true
  has_secure_password
  validates :password, length: { minimum: 6 }
end


