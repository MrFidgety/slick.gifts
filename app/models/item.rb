class Item < ActiveRecord::Base
  has_one :want, as: :wanted, dependent: :destroy
  belongs_to :user
  
  after_create :link_want
  
  validates :name, presence: true, length: { in: 3..60 }
  validates :comment, length: { maximum: 140 }
  validates :link, allow_blank: true, length: { maximum: 2083 }, format: {with: /\A(?:(?:https?|ftp):\/\/)(?:\S+(?::\S*)?@)?(?:(?!10(?:\.\d{1,3}){3})(?!127(?:\.\d{1,3}){3})(?!169\.254(?:\.\d{1,3}){2})(?!192\.168(?:\.\d{1,3}){2})(?!172\.(?:1[6-9]|2\d|3[0-1])(?:\.\d{1,3}){2})(?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])(?:\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}(?:\.(?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(?:(?:[a-z\u00a1-\uffff0-9]+-?)*[a-z\u00a1-\uffff0-9]+)(?:\.(?:[a-z\u00a1-\uffff0-9]+-?)*[a-z\u00a1-\uffff0-9]+)*(?:\.(?:[a-z\u00a1-\uffff]{2,})))(?::\d{2,5})?(?:\/[^\s]*)?\z/i}, uri: true
  validates :code, allow_blank: true, length: { maximum: 60 }
  validates :location, allow_blank: true, length: { maximum: 60 }

  private
  
    # Link this item to a want
    def link_want
      create_want(user_id: user.id)
    end
  
end
