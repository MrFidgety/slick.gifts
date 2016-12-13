class Item < ActiveRecord::Base
  has_one :want, as: :wanted, dependent: :destroy
  belongs_to :user
  
  after_create :link_want
  
  validates :name, presence: true, length: { in: 3..60 }
  validates :name, length: { maximum: 140 }
  validates :link, allow_blank: true, length: { maximum: 2083 }, uri: true

  def link= url_str
    unless url_str.blank?
      unless url_str.split(':')[0] == 'http' || url_str.split(':')[0] == 'https'
          url_str = "http://" + url_str
      end
    end  
    write_attribute :link, url_str
  end

  private
  
    # Link this item to a want
    def link_want
      create_want(user_id: user.id)
    end
  
end
