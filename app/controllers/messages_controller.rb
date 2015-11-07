class MessagesController < ApplicationController
  def index
    @group = current_user.groups.find(params[:group_id])
    @messages = @group.messages.order('created_at desc')
    #usersがGroupに行くたびにgroups_userテーブルのread_atをアップデートする
    # @groups_user = GroupsUser.where(user_id: current_user.id, group_id: @group.id)
    @groups_user = current_user.groups_users.find_by(group_id: @group.id)
    @groups_user.read_at = Time.now
    @groups_user.save
  end

  # ajaxでメッセージを保存
  def create
    # グループがあればそのgroup_idをいれる
    @group = current_user.groups.find(params[:group_id])
    @message = Message.new(message_params)
    @message.user_id = current_user.id
    @message.group_id = @group.id

    if @message.save
      #groupのupdated_atを更新
      @group.updated_at = Time.now  
      @group.save
      flash.notice = 'Create MES'
      @messages = Message.where(group_id: @group.id).order('created_at desc')
    else
      flash.now[:alert] = 'ERROR'
      render action: :index
    end
  end




  private

  def message_params
    params.require(:message).permit(:content, :group_id, :user_id)
  end

  
end




