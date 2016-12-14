class Style < ActiveRecord::Base
  has_one :want, as: :wanted, dependent: :destroy
  belongs_to :user
  
  after_create :link_want
  
  validates :name, presence: true, length: { in: 3..60 }
  validates :comment, length: { maximum: 140 }
  
  private
  
    # Link this interest to a want
    def link_want
      create_want(user_id: user.id)
    end
    
end
