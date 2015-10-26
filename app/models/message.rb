class Message < ActiveRecord::Base
  belongs_to :group
  validates :content, presence: true
end
