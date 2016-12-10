class Style < ActiveRecord::Base
  has_one :want, as: :wanted, dependent: :destroy
  belongs_to :user
  
  after_create :link_want
  
  # Interest name can be from 3 to 140 characters long
  validates :name, presence: true, length: { in: 3..140 }
  
  # Archive the interest
  def archive
    update_attribute(:archived, true)
  end
  
  private
  
    # Link this interest to a want
    def link_want
      create_want(user_id: user.id)
    end
    
end
