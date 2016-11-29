class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  include Devise::Controllers::Rememberable
  
  skip_before_action :verify_authenticity_token
  
  def sign_in_with(provider_name)
    @user = User.from_omniauth(request.env["omniauth.auth"])
    sign_in_and_redirect @user, :event => :authentication
    set_flash_message(:notice, :success, :kind => provider_name) if is_navigational_format?
    remember_me(@user)
  end

  def facebook
    sign_in_with "Facebook"
  end
  
  def developer
    sign_in_with "Developer"
  end
  
  def failure
    flash[:notice] = "Slick.gifts connects you and your Facebook friends for better gift giving."
    redirect_to root_path 
  end

end
