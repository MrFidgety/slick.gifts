class ItemsController < ApplicationController
  
  before_action :correct_user, except: [:create]
  
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
  
  def edit
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
    # Destroy item
    @item.destroy
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