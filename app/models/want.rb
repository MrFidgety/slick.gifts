class Want < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  belongs_to :wanted, polymorphic: true, dependent: :destroy
  
end