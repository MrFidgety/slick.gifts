class Want < ActiveRecord::Base
  belongs_to :user
  belongs_to :wanted, polymorphic: true
  has_many :purchases
  
end