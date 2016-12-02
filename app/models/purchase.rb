class Purchase < ActiveRecord::Base
   belongs_to :purchaseable, :polymorphic => true
   belongs_to :user
   
   enum status: { purchased: 0, gifted: 1, not_received: 2, received: 3 }
end
