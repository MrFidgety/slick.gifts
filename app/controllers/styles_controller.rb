class StylesController < ApplicationController
  
  before_action :signed_in
  before_action :correct_user, except: [:create]
  
  # Prevent flash from appearing twice after AJAX call
  after_filter { flash.discard if request.xhr? }
  
  def create
    # Create new style from params
    @style = current_user.styles.build(style_params)

    # Respond to AJAX call
    respond_to do |format|
      if @style.save
        flash_message :notice, "New style added to your profile"
        flash_message :notice, "You can edit this style during the next 48 hours"
        format.js 
      else
        format.js   { render json: @style.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    # Respond to AJAX call
    respond_to do |format|
      if @style.want.can_edit?
        if @style.update_attributes(style_params)
          flash_message :notice, "Style successfully updated"
          format.js
        else
          format.js   { render json: @style.errors, status: :unprocessable_entity }
        end
      else
        flash_message :notice, "Style can not be edited as it has been active for more than 48 hours"
        flash_message :notice, "Hint: You can always create a new style"
        format.js
      end
    end
  end
  
  def destroy
    # If any purchases have been received, archive style
    if @style.want.purchases.received.any?
      flash_message :notice, "Style archived"
      @style.want.archive
    # If any purchases are currently 'gifted' notify user
    elsif @style.want.purchases.gifted.any?
      flash_message :notice, "Unable to remove. There are outstanding gifts for this style"
    else
      flash_message :notice, "Style remove"
      # Otherwise destroy style
      @style.destroy
    end
  end
  
  private
  
    # Define which params are permitted
    def style_params
      params.require(:style).permit(:name, :comment)
    end
    
    # Ensure only current user can complete actions
    def correct_user
      # Ensure style belongs to current user
      redirect_to root_url unless @style = current_user.styles.find_by(id: params[:id])
    end
end
