class MessagesController < ApplicationController
  def index
    @group = current_user.groups.find(params[:group_id])
    @messages = @group.messages.order('created_at desc')
  end

  def create
    # グループがあればそのgroup_idをいれる
    @group = current_user.groups.find(params[:group_id])
    @message = Message.new(message_params)
    @message.user_id = current_user.id
    @message.group_id = @group.id

    if @message.save
      flash.notice = 'Create MES'
      redirect_to [ @group, :messages ]
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




