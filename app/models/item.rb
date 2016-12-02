class Item < ActiveRecord::Base
  has_many :purchases, as: :purchaseable
  belongs_to :user
  
  # Item name can be from 3 to 140 characters long
  validates :name, presence: true, length: { in: 3..140 }
  
  # Archive the item
  def archive
    update_column(archived: true)
  end
  
end
