class PurchasesController < ApplicationController
  before_filter :find_want
  
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
  
  def gift
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
end
