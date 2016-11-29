class UsersController < ApplicationController
  
  before_action :public_profile,    only: :show
  
  def index
    # Display current user friends
  end
  
  def show
    # Display user wish list
    
  end
  
  private
  
    def public_profile
      @user = User.friendly.find(params[:id])
      
      # Redirect if profile isn't public
      ##
    end
end