class HomeController < ApplicationController

  def top
    if user_signed_in?
      @notes = Note.all.order(created_at: :desc)
      @note  = current_user.notes.build
    else
      @message  = "ようこそPEACEへ！"
    end
  end
  
end


