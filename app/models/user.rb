class User < ActiveRecord::Base
  devise  :rememberable, :trackable, :omniauthable, 
          :omniauth_providers => [:facebook, 
                                  *(:developer if Rails.env.development?)]
                                  
  validates :email, presence: true
                                  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.name = auth.info.name
      user.image = auth.info.image
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at) if auth.credentials.expires_at
    end
  end
end
