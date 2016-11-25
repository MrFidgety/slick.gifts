class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  
  # Prepare meta tags
  before_action :prepare_meta_tags, if: "request.get?"

  def prepare_meta_tags(options={})
    site_name   = "Slick.gifts"
    title       = options[:title] || [controller_name, action_name].join(" ")
    description = options[:description] || "Surprise! It's what you wanted."
    image       = options[:image] || "default-image-url" #view_context.image_url("crucendo-social.png")
    type        = options[:type] || "website"
    current_url = request.url

    # Let's prepare a nice set of defaults
    defaults = {
      site:        site_name,
      title:       title,
      image:       image,
      description: description,
      keywords:    %w[wishlist registry wish list gift gifts present presents],
      fb: {
        app_id:    '353739404981009'
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
