class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]
  before_action :set_user, only: [:show, :edit, :update, :destroy, :like_notes]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    file = params[:user][:image]
    @user.set_image(file)

    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @notes = @user.notes
    @content = "投稿一覧"
  end


  def edit
    @user = User.find(params[:id])
  end

  def update
    file = params[:note]
     # [:image]
    # @user.set_image(file)

    if @user.update(user_params)
      redirect_to user_path, notice: "編集されました"
    else
      render :edit
    end
  end

  def like_notes
    @notes = @user.like_notes
    @content = "いいね！一覧"
    render :show
  end

  

  def search_index
    @users = User.search(params[:search])
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
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
      params.require(:user).permit(:name, :email, :national, :password, :password_confirmation)
    end

    def correct_user
      user = User.find(params[:id])
    end

end
