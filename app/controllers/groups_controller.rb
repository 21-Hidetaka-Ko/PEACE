class GroupsController < ApplicationController
  def create
  Group.create
  @group.groups_users.build(params[:user_id])
  @group.groups_users.build(current_user)
  end
end

