class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]
  before_action :set_user, only: [:show, :edit, :update, :destroy, :like_notes]


  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json

  def show
    @notes = @user.notes
    @content = "投稿一覧"
  end


  # GET /users/new

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    file = params[:note][:image]
    @user.set_image(file)

    if @user.update(user_params)
      redirect_to @user, notice: 'ユーザー情報が更新されました'
    else
      render :edit
    end
  end

  def like_notes
    @notes = @user.like_notes
    @content = "いいね！一覧"
    render :show
  end

  # DELETE /users/1
  # DELETE /users/1.json
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :sex, :major, :birthday, :password, :password_confirmation, :university, :national)
    end
end
