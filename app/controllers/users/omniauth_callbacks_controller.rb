class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  include Devise::Controllers::Rememberable
  
  skip_before_action :verify_authenticity_token
  
  def sign_in_with(provider_name)
    @user = User.from_omniauth(request.env["omniauth.auth"])
    @user.read_from_omniauth(request.env["omniauth.auth"])
    flash_message :facebook, "Successfully logged in with Facebook"
    flash_message :notice, "By the way, this is where we show you alerts"
    flash_message :notice, "They can be dismissed by tapping this bar"
    sign_in_and_redirect @user, :event => :authentication
    remember_me(@user)
  end

  def facebook
    sign_in_with "Facebook"
  end
  
  def developer
    sign_in_with "Developer"
  end
  
  def failure
    flash_message :notice, "Slick.gifts connects you and your Facebook friends for better gift giving"
    redirect_to root_path 
  end

end
