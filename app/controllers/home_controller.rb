class HomeController < ApplicationController

	def top
	  if user_signed_in?
	  	@note = Note.new
	  	@notes = Note.all.order(created_at: :desc)
	  	@note  = current_user.notes.build
        @feed_items = current_user.feed.paginate(page: params[:page])
	  else
	  	@message  = "ようこそPEACEへ！"
	  end
	end
	
end


