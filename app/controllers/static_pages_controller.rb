class StaticPagesController < ApplicationController
  def home
    # Set page meta tags
    prepare_meta_tags(title: "Surprise! It's what you wanted. #NoBadGifts",
                      description: "Make a list of the things you want, your interests, and style.  View your friends lists and never get a bad gift again.")
  end

  def help
  end
  
  def about
  end
  
  def contact
  end
end