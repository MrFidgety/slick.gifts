class StylesController < ApplicationController
  before_action :correct_user, except: [:create]
  
  # Prevent flash from appearing twice after AJAX call
  after_filter { flash.discard if request.xhr? }
  
  def create
    # Create new style from params
    @style = current_user.styles.build(style_params)

    # Respond to AJAX call
    respond_to do |format|
      if @style.save
        format.js 
      else
        format.js   { render json: @style.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    # Respond to AJAX call
    respond_to do |format|
      if @style.update_attributes(style_params)
        format.js
      else
        format.js   { render json: @style.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    # If any purchases have been received, archive style
    if @style.want.purchases.received.any?
      @style.archive
    # If any purchases are currently 'gifted' notify user
    elsif @style.want.purchases.gifted.any?
      flash[:notice] = "Unable to delete while outstanding gifted item"
    else
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
