class InterestsController < ApplicationController
  
  before_action :signed_in
  before_action :correct_user, except: [:create]
  
  # Prevent flash from appearing twice after AJAX call
  after_filter { flash.discard if request.xhr? }
  
  def create
    # Create new interest from params
    @interest = current_user.interests.build(interest_params)

    # Respond to AJAX call
    respond_to do |format|
      if @interest.save
        flash_message :notice, "New interest added to your profile"
        flash_message :notice, "You can edit this interest during the next 48 hours"
        format.js 
      else
        format.js   { render json: @interest.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    # Respond to AJAX call
    respond_to do |format|
      if @interest.want.can_edit?
        if @interest.update_attributes(interest_params)
          flash_message :notice, "Interest successfully updated"
          format.js
        else
          format.js   { render json: @interest.errors, status: :unprocessable_entity }
        end
      else
        flash_message :notice, "Interest can not be edited as it has been active for more than 48 hours"
        flash_message :notice, "Hint: You can always create a new interest"
        format.js
      end
    end
  end
  
  def destroy
    # If any purchases have been received, archive interest
    if @interest.want.purchases.received.any?
      flash_message :notice, "Interest archived"
      @interest.archive
    # If any purchases are currently 'gifted' notify user
    elsif @interest.want.purchases.gifted.any?
      flash_message :notice, "Unable to remove. There are outstanding gifts for this interest"
    else
      flash_message :notice, "Interest removed"
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
