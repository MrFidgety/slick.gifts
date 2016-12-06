class ApplicationController < ActionController::Base
  include ApplicationHelper
  
  protect_from_forgery with: :exception
  
  # Prepare meta tags
  before_action :prepare_meta_tags, if: "request.get?"
  
  # Handle redirect after sign in
  def after_sign_in_path_for(resource)
    user_path(current_user)
  end
  
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
