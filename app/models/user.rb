class User < ActiveRecord::Base
  extend FriendlyId

  friendly_id :uid, use: [:slugged]
  
  devise  :rememberable, :trackable, :omniauthable, 
          :omniauth_providers => [:facebook, 
                                  *(:developer if Rails.env.development?)]
                                  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create
    # do |user|
    #   user.email = auth.info.email if auth.info.email.present?
    #   user.name = auth.info.name if auth.info.name.present?
    #   user.image = auth.info.image if auth.info.image.present?
    #   user.oauth_token = auth.credentials.token if auth.credentials.token.present?
    #   user.oauth_expires_at = Time.at(auth.credentials.expires_at) if auth.credentials.expires_at.present?
    # end
  end
  
  def update_details(auth)
    email = auth.info.email if auth.info.email.present?
    name = auth.info.name if auth.info.name.present?
    image = auth.info.image if auth.info.image.present?
    oauth_token = auth.credentials.token if auth.credentials.token.present?
    oauth_expires_at = Time.at(auth.credentials.expires_at) if auth.credentials.expires_at.present?
  end
  
  def is_friend?(user)
    @graph = Koala::Facebook::API.new(oauth_token)
    @graph.get_connections("me", "friends/#{user.uid}").present?
  end
end
