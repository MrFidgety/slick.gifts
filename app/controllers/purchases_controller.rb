class PurchasesController < ApplicationController
  before_filter :find_want
  before_filter :purchase_owner, only: :give
  
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
        format.js 
      else
        format.js   { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def give
    # Update status to gifted
    @purchase.set_status(:gifted)
  end
  
  def receive
    # Update status to received or not-received
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
end
