class InterestsController < ApplicationController
  
  before_action :correct_user, except: [:create]
  
  # Prevent flash from appearing twice after AJAX call
  after_filter { flash.discard if request.xhr? }
  
  def create
    # Create new interest from params
    @interest = current_user.interests.build(interest_params)

    # Respond to AJAX call
    respond_to do |format|
      if @interest.save
        format.js 
      else
        format.js   { render json: @interest.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    # Respond to AJAX call
    respond_to do |format|
      if @interest.update_attributes(interest_params)
        format.js
      else
        format.js   { render json: @interest.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    # If any purchases have been received, archive interest
    if @interest.want.purchases.received.any?
      @interest.archive
    # If any purchases are currently 'gifted' notify user
    elsif @interest.want.purchases.gifted.any?
      flash[:notice] = "Unable to delete while outstanding gifted item"
    else
      # Otherwise destroy interest
      @interest.destroy
    end
  end
  
  private
  
    # Define which params are permitted
    def interest_params
      params.require(:interest).permit(:name, :comment)
    end
    
    # Ensure only current user can complete actions
    def correct_user
      # Ensure interest belongs to current user
      redirect_to root_url unless @interest = current_user.interests.find_by(id: params[:id])
    end
end
