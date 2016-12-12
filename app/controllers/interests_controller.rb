class InterestsController < ApplicationController
  
  before_action :signed_in
  before_action :correct_user, except: [:create, :show]
  before_action :determine_view_access, only: :show
  
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
  
  def show
    # Set up new purchase for interest
    @purchase = @interest.want.purchases.new if @want_view_access == "view"
    @purchases = @interest.want.purchases.order(updated_at: :desc) if @want_view_access == "view"
    @purchases = @interest.want.purchases.received.order(updated_at: :desc) if @want_view_access == "edit"
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
    # If any purchases are currently 'gifted' notify user
    if @interest.want.purchases.gifted.any?
      flash_message :notice, "Unable to remove. There are outstanding gifts for this interest"
      flash_message :notice, "Manage your gifts #{view_context.link_to("here", root_path)}"
    else
      flash_message :notice, "Interest removed"
      # Archive interest if there are any linked purchases
      if @interest.want.purchases.any?
        @interest.want.archive
      else
        @interest.destroy
      end
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
    
    # Ensure only friends can view
    def determine_view_access
      @interest = Interest.find(params[:id])
      # Determine want view access
      if user_signed_in?
        if @interest.user == current_user
          @want_view_access = "edit"
        elsif current_user.is_friend?(@interest.user)
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
