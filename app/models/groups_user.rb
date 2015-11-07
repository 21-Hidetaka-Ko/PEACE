class GroupsUser < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  belongs_to :group, dependent: :destroy
end


