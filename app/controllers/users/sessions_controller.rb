class Users::SessionsController < Devise::SessionsController

  def new
    super
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # ユーザーをサインインさせ、ユーザーページ (show) にリダイレクトする。
      sign_in user
      redirect_to user
    else
      flash[:error] = 'Invalid email/password combination' # 誤りあり!
      render 'new'
    end
  end

  def destroy
  	sign_out
    redirect_to root_url
  end
end