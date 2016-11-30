class UsersController < ApplicationController

  before_action :determine_view_access,    only: :show
  
  def index
    # Get current user friends
    @graph = Koala::Facebook::API.new(current_user.oauth_token)
    friend_array = @graph.get_connections("me", "friends")
    @friends = User.where(slug: friend_array.map { |f| f["id"] }) if friend_array
  end
  
  def show
    # Display user wish list
    
  end
  
  def settings
  end
  
  private
  
    def determine_view_access
      @user = User.friendly.find(params[:id])
     
      # Determine user view access
      if user_signed_in?
        if current_user == @user
          @view_access = "edit"
        elsif current_user.is_friend?(@user)
          @view_access = "view"
        else
          @view_access = "restricted"
        end
      else
        @view_access = "restricted"
      end
    end
end