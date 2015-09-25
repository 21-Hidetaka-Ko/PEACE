class NotesController < ApplicationController
  def new
  end

  def create
   @note = Note.new
   @image =params[:image]
   @content = params[:content]
   @note.save
  end

end
