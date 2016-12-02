class PurchasesController < ApplicationController
  before_filter :load_purchaseable
  
  def index
    @purchases = @purchaseable.purchases
  end
  
  def new
    @purchase = @purchaseable.purchases.new
  end
  
  def create
    # Create new purchase from params
    @purchase = @purchaseable.purchases.build(purchase_params)
    # Respond to AJAX call
    respond_to do |format|
      if @purchase.save
        format.js 
      else
        format.js   { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end
    
  private
  
    # Find purchaseable element
    def load_purchaseable
      klass = [Item, Interest, Style].detect { |c| params["#{c.name.underscore}_id"]}
      @purchaseable = klass.find(params["#{klass.name.underscore}_id"])
    end
    
    # Define which params are permitted
    def purchase_params
      params.require(:purchase).permit(:comment, :status)
    end
end
