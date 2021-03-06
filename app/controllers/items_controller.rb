class ItemsController < ApplicationController
  
  before_action :signed_in
  before_action :correct_user, except: [:create, :show]
  before_action :determine_view_access, only: :show
  
  # Prevent flash from appearing twice after AJAX call
  after_filter { flash.discard if request.xhr? }
  
  def create
    # Create new item from params
    @item = current_user.items.build(item_params)

    # Respond to AJAX call
    respond_to do |format|
      if @item.save
        flash_message :notice, "New item added to your profile"
        flash_message :notice, "You can edit this item during the next 48 hours"
        format.js 
      else
        format.js   { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def show
    # Set up new purchase for item
    @purchase = @item.want.purchases.new if @want_view_access == "view"
    @purchases = @item.want.purchases.order(updated_at: :desc) if @want_view_access == "view"
    @purchases = @item.want.purchases.received.order(updated_at: :desc) if @want_view_access == "edit"
  end
  
  def update
    # Respond to AJAX call
    respond_to do |format|
      if @item.want.can_edit?
        if @item.update_attributes(item_params)
          flash_message :notice, "Item successfully updated"
          format.js
        else
          format.js   { render json: @item.errors, status: :unprocessable_entity }
        end
      else
        flash_message :warning, "Item cannot be edited as it has been active for more than 48 hours"
        flash_message :notice, "Hint: You can always create a new item"
        format.js
      end
    end
  end
  
  def destroy
    # If any purchases are currently 'gifted' notify user
    if @item.want.purchases.gifted.any?
      flash_message :warning, "Unable to remove. There are outstanding gifts for this item"
      flash_message :notice, "Manage your gifts #{view_context.link_to("here", root_path)}"
    else
      flash_message :notice, "Item removed"
      # Archive item if there are any linked purchases
      if @item.want.purchases.any?
        @item.want.archive
      else
        @item.destroy
      end
    end
  end
  
  private
  
    # Define which params are permitted
    def item_params
      params.require(:item).permit(:name, :comment, :link, :code, :location)
    end
    
    # Ensure only current user can complete actions
    def correct_user
      # Ensure item belongs to current user
      redirect_to root_url unless @item = current_user.items.find_by(id: params[:id])
    end
    
    # Ensure only friends can view
    def determine_view_access
      @item = Item.find(params[:id])
      # Determine want view access
      if user_signed_in?
        if @item.user == current_user
          @want_view_access = "edit"
        elsif current_user.is_friend?(@item.user)
          @want_view_access = "view"
        else
          @want_view_access = "restricted"
        end
      else
        @want_view_access = "restricted"
      end
      
      # Currently should not allow view at all if restricted
      redirect_to root_url if @want_view_access == "restricted"
    end
end