class GroupsController < ApplicationController
  def create
    group = current_user.same_group_with(User.find(params[:user_id]))
    if group
      @group = group
    else
      @group = Group.create
      @group.groups_users.create(user_id: params[:user_id])
      @group.groups_users.create(user: current_user)
    end
    redirect_to [ @group, :messages ]
  end

  def index
   @groups = current_user.groups
   @groups_user = GroupsUser.find_by(user: current_user.group)
  end

end

