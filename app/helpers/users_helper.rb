module UsersHelper
  
  # Get user bio
  def user_bio(user)
    # Find an active interest
    want_interest = user.wants.where(wanted_type: "Interest", archived: false).order("RANDOM()").first
    interest_name = want_interest.wanted.name if want_interest
    # Find an active item
    want_item = user.wants.where(wanted_type: "Item", archived: false).order("RANDOM()").first
    item_name = want_item.wanted.name if want_item
    
    bio = Array.new 
    bio.push "interested in #{interest_name.downcase}" if interest_name
    bio.push "wants #{item_name.downcase}" if item_name
    bio.to_sentence
  end
  
  # Get user wants info
  def user_wants(user)
    interest_count = user.interests.includes(:want).where(wants: {archived: false}).size
    item_count = user.items.includes(:want).where(wants: {archived: false}).size
    style_count = user.styles.includes(:want).where(wants: {archived: false}).size
    
    wants = Array.new
    wants.push "#{item_count.humanize} #{"item".pluralize(item_count)}" if item_count > 0
    wants.push "#{interest_count.humanize} #{"interest".pluralize(interest_count)}" if interest_count > 0
    wants.push "#{style_count.humanize} #{"style".pluralize(style_count)}" if style_count > 0
    "has #{wants.to_sentence}"
  end
end
