class ItemsController < ApplicationController
  
  before_action :correct_user, except: [:create]
  
  # Prevent flash from appearing twice after AJAX call
  after_filter { flash.discard if request.xhr? }
  
  def create
    # Create new item from params
    @item = current_user.items.build(item_params)
    # Respond to AJAX call
    respond_to do |format|
      if @item.save
        format.js 
      else
        format.js   { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    # Respond to AJAX call
    respond_to do |format|
      if @item.update_attributes(item_params)
        format.js
      else
        format.js   { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    flash[:notice] = "Unable to delete while outstanding gifted item"
    # # If any purchases have been received, archive item
    # if @item.purchases.received.any?
    #   @item.archive
    # # If any purchases are currently 'gifted' notify user
    # elsif @item.purchases.gifted.any?
    #   flash[:notice] = "Unable to delete while outstanding gifted item"
    # else
    #   # Otherwise destroy item
    #   @item.destroy
    # end
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