class Message < ActiveRecord::Base
  belongs_to :group
  validates presence: true
  validates presence: true
end
