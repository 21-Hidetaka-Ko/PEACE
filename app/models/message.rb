class Message < ActiveRecord::Base
  belongs_to :from_user_id
  validates :from_user_id, presence: true
  validates :to_user_id, presence: true
end
