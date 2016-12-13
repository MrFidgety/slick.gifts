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
    "#{user.interests.size.humanize} interests"
  end
end
