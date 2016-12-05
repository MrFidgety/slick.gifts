class StaticPagesController < ApplicationController
  def home
    # Set page meta tags
    @page_title = "Begin"
  end

  def help
  end
  
  def about
  end
  
  def contact
  end
end
