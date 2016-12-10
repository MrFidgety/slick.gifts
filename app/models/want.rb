class Want < ActiveRecord::Base
  belongs_to :user
  belongs_to :wanted, polymorphic: true, dependent: :destroy
  has_many :purchases, dependent: :nullify
  
  def can_edit?
    wanted.created_at > 48.hours.ago
  end

  def archive
    update_attribute(:archived, true)
  end
end