class Want < ActiveRecord::Base
  belongs_to :user
  belongs_to :wanted, polymorphic: true, dependent: :destroy
  has_many :purchases, dependent: :nullify
  
end