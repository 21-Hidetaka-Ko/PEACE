class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def create
    # グループがあればそのgroup_idをいれる
    @message = Message.create!(message_params)
    # @message = Group.new
    @message = Message.find(message_params)
    @message = Message.new(message_params)
    @message.save
  end


  private

  def message_params
    params.require(:message).permit(:content, :group_id, :user_id)
  end

  
end




