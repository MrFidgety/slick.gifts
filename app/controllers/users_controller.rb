class UsersController < ApplicationController

  before_action :determine_view_access,    only: :show
  
  def index
    # Get current user friends
    @graph = Koala::Facebook::API.new(current_user.oauth_token)
    friend_array = @graph.get_connections("me", "friends")
    @friends = User.where(slug: friend_array.map { |f| f["id"] }) if friend_array
    
    # Get all purchases from current user that are purchased or not received
    @actionable_purchases = current_user.purchases.where(status: Purchase.statuses[:purchased, :not_received])
    
    # Get all purchases for current user that have been gifted
    @actionable_gifts = Purchase.joins(:items).where(items: {user_id: current_user.id})
    #@actionable_gifts = current_user.items.includes(:purchases).where(purchases: { status: Purchase.statuses[:gifted] } )
  end
  
  def show
    @items = @user.items
    
    if @view_access == "edit"
      # Set up new elements user can create
      @item = Item.new
    end
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