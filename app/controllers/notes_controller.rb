class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  def index
    @notes = Note.all
  end

  def show
  end



  def new
     @note = Note.new
  end


  def create
    @note = Note.new(note_params)
    file = params[:note][:image]
    @note.set_image(file)

    if @note.save
      redirect_to @note, notice: 'ユーザーが保存されました'
    else
      render :new
    end
  end

  

  def edit
  end

  def update
    file = params[:note][:image]
    @note.set_image(file)

    if @note.update(note_params)
      redirect_to @note, notice: 'ユーザー情報が更新されました'
    else
      render :edit
    end
  end

  def destroy
    @note.destroy
    redirect_to notes_path
  end

  private

    def set_note
      @note = Note.find(params[:id])
    end


    def note_params
      params.require(:note).permit(:content, :user_id)
    end
end
