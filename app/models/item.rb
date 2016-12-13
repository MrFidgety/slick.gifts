class Item < ActiveRecord::Base
  has_one :want, as: :wanted, dependent: :destroy
  belongs_to :user
  
  after_create :link_want
  
  validates :name, presence: true, length: { in: 3..60 }
  validates :name, length: { maximum: 140 }
  validates :link, allow_blank: true, uri: true

  private
  
    # Link this item to a want
    def link_want
      create_want(user_id: user.id)
    end
  
end
