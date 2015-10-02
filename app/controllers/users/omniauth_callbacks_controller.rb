class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    callback_from:facebook
  end

  private
    def callback_from(provider)
      logger.debug "OK"
      provider = provider.to_s
      @user = User.find_for_oauth(request.env['omniauth.auth'])
      if @user.persisted?
        cookies.permanent[:xxx_logined] = { value: @user.created_at }
        flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
      else
        if provider == 'twitter'
          session["devise.twitter_data"] = request.env["omniauth.auth"].except("extra")
        else
          session["devise.facebook_data"] = request.env["omniauth.auth"]
        end
        logger.debug request.env["omniauth.auth"]


        redirect_to new_user_registration_url
      end
    end
  end