class GroupsController < ApplicationController
  def create
    @group = Group.create
    @group.groups_users.create(user_id: params[:user_id])
    @group.groups_users.create(user: current_user)
    redirect_to [ @group, :messages ]
  end

  def index
   @groups = current_user.groups
  end

end

