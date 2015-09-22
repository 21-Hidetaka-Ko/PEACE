class User < ActiveRecord::Base

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :sex, presence: true
  validates :major, presence: true
  validates :birthday, presence: true
  validates :password, presence: true
  validates :university, presence: true
  validates :national, presence: true
end


