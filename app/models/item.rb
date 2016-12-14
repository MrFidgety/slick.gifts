class Item < ActiveRecord::Base
  has_one :want, as: :wanted, dependent: :destroy
  belongs_to :user
  
  after_create :link_want
  
  validates :name, presence: true, length: { in: 3..60 }
  validates :comment, length: { maximum: 140 }
  validates :link, allow_blank: true, length: { maximum: 2083 }, uri: true
  validates :code, allow_blank: true, length: { maximum: 60 }
  validates :location, allow_blank: true, length: { maximum: 60 }

  private
  
    # Link this item to a want
    def link_want
      create_want(user_id: user.id)
    end
  
end
