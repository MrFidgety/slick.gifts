class StaticPagesController < ApplicationController
  def home
    # Set page meta tags
    prepare_meta_tags(title: "Surprise! It's what you wanted. #NoBadGifts",
                      description: "Make a list of the things you want, your interests, and style.  View your friends lists and never get a bad gift again.")
  end
  
  def overview
    prepare_meta_tags(title: "Overview")
    @user_count = User.all.size
    @want_count = Want.where(archived: false).size
    @interest_count = Want.where(archived: false, wanted_type: 'Interest').size
    @item_count = Want.where(archived: false, wanted_type: 'Item').size
    @style_count = Want.where(archived: false, wanted_type: 'Style').size
    @gifted_count = Purchase.received.size
    @purchased_count = Purchase.all.size - @gifted_count
  end

  def help
  end
  
  def about
  end
  
  def contact
  end
end