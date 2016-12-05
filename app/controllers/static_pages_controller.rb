class StaticPagesController < ApplicationController
  def home
    # Set page meta tags
    prepare_meta_tags(title: 'Continue with Facebook')
  end

  def help
  end
  
  def about
  end
  
  def contact
  end
end