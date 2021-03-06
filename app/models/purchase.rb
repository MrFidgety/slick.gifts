class Purchase < ActiveRecord::Base
  belongs_to :want
  belongs_to :user
   
  enum status: { purchased: 0, gifted: 1, not_received: 2, received: 3 }
  
  validates :comment, length: { maximum: 140 }
   
  scope :for_statuses, ->(values) do
    return all if values.blank?
    where(status: statuses.values_at(*Array(values)))
  end
  
  def set_status(new_status)
    update_attribute(:status, Purchase.statuses[new_status])
  end
end
