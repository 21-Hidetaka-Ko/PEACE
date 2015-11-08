class GroupsController < ApplicationController
  def create
    group = current_user.same_group_with(User.find(params[:user_id]))
    if group
      @group = group
    else
      @group = Group.create
      # group, userに紐付いた@groups_userのインスタンスを生成
      @groups_user = @group.groups_users.build(user_id: params[:user_id])
      @groups_user.read_at = Time.now
      @groups_user.save



      # @group.groups_users.create(user: current_user)
      @groups_user = @group.groups_users.build(user_id: current_user.id)
      @groups_user.read_at = Time.now
      @groups_user.save
      
    end
    redirect_to groups_path
    # [ @group, :messages ]
  end

  def index
    # @groupsに、current_userが持っているグループをupdated_atの順番で取得
    @groups = current_user.groups.order(updated_at: :desc)
    # updated_atが最新のグループを取得
    @group = @groups.first
    # そのグループのメッセージを降順で取得
    @messages = Message.where(group: @group).order(created_at: :desc)
  end

  def move_message
    
    @group = Group.find_by(id: params[:group_id])
    @messages = Message.where(group: @group).order(created_at: :desc)

  end



  private

  def message_params
    params.require(:message).permit(:group_id, :user_id)
  end

  

end

