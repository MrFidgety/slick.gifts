class PurchasesController < ApplicationController
  before_filter :find_want
  before_filter :purchase_owner, only: :gift
  before_filter :want_owner, only: [:receive, :not_receive]
  
  # Prevent flash from appearing twice after AJAX call
  after_filter { flash.discard if request.xhr? }
  
  def index
    @purchases = @want.purchases
  end
  
  def new
    @purchase = @want.purchases.new
  end
  
  def create
    # Create new purchase from params
    @purchase = @want.purchases.build(purchase_params)
    # Purchase owned by current user
    @purchase.user = current_user
    
    # Respond to AJAX call
    respond_to do |format|
      if @purchase.save
        flash_message :notice, "You have purchased something for #{@want.user.name}"
        format.js 
      else
        format.js   { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def gift
    flash_message :notice, "You have gifted something to #{@want.user.name}"
    # Update status to gifted
    @purchase.set_status(:gifted)
  end
  
  def receive
    flash_message :notice, "#{@purchase.user.name} says Surprise! It's what you wanted"
    # Update status to received or not-received
    @purchase.set_status(:received)
  end
  
  def not_receive
    flash_message :notice, "We've let #{@purchase.user.name} know that you didnt receive their gift"
    # Update status to received or not-received
    @purchase.set_status(:not_received)
  end
    
  private
  
    # Define which params are permitted
    def purchase_params
      params.require(:purchase).permit(:comment, :status)
    end
    
    # Find associated want
    def find_want
      @want = Want.find(params[:want_id])
    end
    
    # Ensure current user is purchase owner
    def purchase_owner
      redirect_to root_url unless @purchase = current_user.purchases.find(params[:id])
    end
    
    # Ensure current user is want owner
    def want_owner
      redirect_to root_url unless @want = current_user.wants.find(params[:want_id])
      @purchase = Purchase.find(params[:id])
    end
end
