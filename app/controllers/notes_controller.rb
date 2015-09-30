class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy, :liking_users]

  def index
    @notes = Note.all
  end

  def show
  end



  def new
     @note = Note.new
  end


  def create
    @note = current_user.notes.build(note_params)
    if @note.save
      redirect_to @note, notice: "投稿が保存されました"
    else
      @notes = Note.all.order(created_at: :desc)
      render 'home/top'
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

  def liking_users
    @users = @note.liking_users
  end

  private

    def set_note
      @note = Note.find(params[:id])
    end


    def note_params
      params.require(:note).permit(:content, :user_id)
    end
end
