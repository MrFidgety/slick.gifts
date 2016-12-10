class ItemsController < ApplicationController
  
  before_action :signed_in
  before_action :correct_user, except: [:create]
  
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
        flash_message :notice, "Item can not be edited as it has been active for more than 48 hours"
        flash_message :notice, "Hint: You can always create a new item"
        format.js
      end
    end
  end
  
  def destroy
    # If any purchases have been received, archive item
    if @item.want.purchases.received.any?
      flash_message :notice, "Item archived"
      @item.want.archive
    # If any purchases are currently 'gifted' notify user
    elsif @item.want.purchases.gifted.any?
      flash_message :notice, "Unable to remove. There are outstanding gifts for this item"
    else
      flash_message :notice, "Item remove"
      # Otherwise destroy item
      @item.destroy
    end
  end
  
  private
  
    # Define which params are permitted
    def item_params
      params.require(:item).permit(:name, :comment)
    end
    
    # Ensure only current user can complete actions
    def correct_user
      # Ensure item belongs to current user
      redirect_to root_url unless @item = current_user.items.find_by(id: params[:id])
    end
end