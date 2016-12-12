module UsersHelper
  
  # Get user bio
  def user_bio(user)
    # Find an active interest
    want_interest = user.wants.where(wanted_type: "Interest", archived: false).order("RANDOM()").first
    if want_interest
      interest_name = want_interest.wanted.name
    # Find an active item
    want_item = user.wants.where(wanted_type: "Item", archived: false).order("RANDOM()").first
    if want_item
      item_name = want_interest.wanted.name
    
    bio = "Interested in #{interest_name} and wants #{item_name}"
  end
end
