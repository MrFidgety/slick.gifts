module UsersHelper
  
  # Get user bio
  def user_bio(user)
    # Find an active interest
    interest = user.wants.where(wanted_type: "Interest", archived: false).order("RANDOM()").first.wanted
    # Find an active item
    item = user.wants.where(wanted_type: "Item", archived: false).order("RANDOM()").first.wanted
    
    bio = "Interested in #{interest} and wants #{item}"
  end
end
