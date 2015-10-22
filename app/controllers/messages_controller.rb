class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def create
    if Conversation.between(params[:user_id],params[:group_id]).present?
      @conversation = Conversation.between(params[:user_id],params[:group_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end

    render json: { conversation_id: @conversation.id }
  end

  def show
    @conversation = Conversation.find(params[:id])
    @reciever = interlocutor(@conversation)
    @messages = @conversation.messages
    @message = Message.new
  end

  private

  def message_params
    params.require(:message).permit(:group_id, :user_id)
  end
  
end

