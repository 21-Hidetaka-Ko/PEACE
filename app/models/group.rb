class Group < ActiveRecord::Base
  has_many :messages
  has_many :groups_users
end
