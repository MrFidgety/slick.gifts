class ApplicationController < ActionController::Base
  include ApplicationHelper
  
  protect_from_forgery with: :exception
  
  before_action :prepare_meta_tags, if: "request.get?"
  before_action :store_current_location, :unless => :devise_controller?
  
  # Handle redirect after sign in
  def store_current_location
    store_location_for(:user, request.url)
  end
  
  # Only allow signed in users
  def signed_in
    redirect_to root_url unless user_signed_in?
  end
  
  # Prepare meta tags
  def prepare_meta_tags(options={})
    site_name   = "Slick.gifts"
    title       = options[:title] || [controller_name, action_name].join(" ")
    description = options[:description] || "Surprise! It's what you wanted."
    image       = options[:image] || view_context.image_url("slick_gifts_social.png")
    type        = options[:type] || "website"
    current_url = "https://#{request.host+request.fullpath}"

    # Let's prepare a nice set of defaults
    defaults = {
      site:        site_name,
      title:       title,
      image:       image,
      description: description,
      keywords:    %w[wishlist registry wish list gift gifts present presents],
      fb: {
        app_id:    ENV["FACEBOOK_API_KEY"]
      },
      twitter: {
        site_name: site_name,
        site: '@slickgifts',
        card: 'summary',
        title: title,
        description: description,
        image: image
      },
      og: {
        url: current_url,
        site_name: site_name,
        title: title,
        image: image,
        description: description,
        type: type
      }
    }

    options.reverse_merge!(defaults)
    set_meta_tags options
  end
  
end
