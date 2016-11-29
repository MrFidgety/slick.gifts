class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  include Devise::Controllers::Rememberable
  
  skip_before_action :verify_authenticity_token
  
  def sign_in_with(provider_name)
    @user = User.from_omniauth(request.env["omniauth.auth"])
    
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, :kind => provider_name) if is_navigational_format?
      remember_me(@user)
    else
      # Display message advising Facebook permission required to use application
      flash[:notice] = "We need your email to continue"
      redirect_to root_path
    end
  end

  def facebook
    sign_in_with "Facebook"
  end
  
  def developer
    sign_in_with "Developer"
  end
  
  def failure
    # Display message advising Facebook permission required to use application
    flash[:notice] = "We require Facebook permission so you can use this app"
    redirect_to root_path 
  end

end
