class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  before_action :create_provider_session, except: :failure

  def facebook
  end

  def github
  end

  def failure
    redirect_to root_path
  end

  private

  def create_provider_session
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication # this will throw if @user is not activated
      set_flash_message(:notice, :success, kind: request.env['omniauth.auth'].provider) if is_navigational_format?
    else
      session["devise.#{request.env['omniauth.auth'].provider}"] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end
end