class StaticPagesController < ApplicationController
  def home
    # Set page meta tags
    prepare_meta_tags(title: "Surprise! It's what you wanted. #NoBadGifts")
  end

  def help
  end
  
  def about
  end
  
  def contact
  end
end