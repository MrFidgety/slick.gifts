class User < ActiveRecord::Base
  extend FriendlyId
  
  has_many :items

  friendly_id :uid, use: [:slugged]
  
  devise  :rememberable, :trackable, :omniauthable, 
          :omniauth_providers => [:facebook, 
                                  *(:developer if Rails.env.development?)]
  
  # Find or create user from omniauth provider and uid                                
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize
  end
  
  # Update user from omniauth hash
  def read_from_omniauth(auth)
    self.email = auth.info.email if auth.info.email.present?
    self.name = auth.info.name if auth.info.name.present?
    self.image = auth.info.image if auth.info.image.present?
    self.oauth_token = auth.credentials.token if auth.credentials.token.present?
    self.oauth_expires_at = Time.at(auth.credentials.expires_at) if auth.credentials.expires_at.present?
    self.save!
  end
  
  # Check if a specific user is a facebook friend
  def is_friend?(user)
    @graph = Koala::Facebook::API.new(oauth_token)
    @graph.get_connections("me", "friends/#{user.uid}").present?
  end
end
