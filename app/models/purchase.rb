class Purchase < ActiveRecord::Base
   belongs_to :purchaseable, :polymorphic => true
   belongs_to :user
end
