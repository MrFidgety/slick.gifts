class Purchase < ActiveRecord::Base
   belongs_to :purchaseable, :polymorphic => true
end
