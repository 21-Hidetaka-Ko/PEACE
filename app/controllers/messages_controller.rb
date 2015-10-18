class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def create
    @message = Message.create!(message_params)
  end

  private

  def message_params
    params.require(:message).permit(:content, :from_user_id, :to_user_id)
  end

  
end