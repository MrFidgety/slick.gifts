class UsersController < ApplicationController
  
  before_action :determine_view_access,    only: :show
  
  def index
    # Display current user friends
  end
  
  def show
    # Display user wish list
    
  end
  
  def settings
  end
  
  private
  
    def determine_view_access
      @user = User.friendly.find(params[:id])
     
      if user_signed_in?
        if current_user.equal?(@user) || current_user.is_friend?(@user)
          # If logged in, and is current user or friend of user, access is allowed
          @view_access = true
        else
          # If logged in and is not friend of user, access is restricted
          @view_access = false
        end
      else
        # If not logged in, access is restricted
        @view_access = false
      end
    end
end