class GroupsController < ApplicationController
  def create
    group = current_user.same_group_with(User.find(params[:user_id]))
    if group
      @group = group
    else
      @group = Group.create
      # @groups_users = GroupsUser.new
      # @groups_users.read_at = Time.now

      # group, userに紐付いた@groups_userのインスタンスを生成
      @groups_user = @group.groups_users.build(user_id: params[:user_id])
      @groups_user.read_at = Time.now
      @groups_user.save



      # @group.groups_users.create(user: current_user)
      @groups_user = @group.groups_users.build(user_id: current_user.id)
      @groups_user.read_at = Time.now
      @groups_user.save
      
    end
    redirect_to [ @group, :messages ]
    # redirect_to 
  end

  def index
   @groups = current_user.groups
   
  end

end

