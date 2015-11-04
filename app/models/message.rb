class Message < ActiveRecord::Base
  belongs_to :group, dependent: :destroy
  validates :content, presence: true

  
end
