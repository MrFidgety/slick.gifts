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
  
  # Get user wants sentence
  def user_wants_sentence(user)
    interest_count = user.interests.includes(:want).where(wants: {archived: false}).size
    item_count = user.items.includes(:want).where(wants: {archived: false}).size
    style_count = user.styles.includes(:want).where(wants: {archived: false}).size
    
    wants = Array.new
    wants.push "#{item_count.humanize} #{"item".pluralize(item_count)}" if item_count > 0
    wants.push "#{interest_count.humanize} #{"interest".pluralize(interest_count)}" if interest_count > 0
    wants.push "#{style_count.humanize} #{"style".pluralize(style_count)}" if style_count > 0
    
    wants.any? ? "has #{wants.to_sentence}" : "is going to add something to their list, I'm sure of it"
  end
  
  # Get user received icons
  def user_received_icons(user)
    # Get number of each type
    received_count = Purchase.includes(:want).where(wants: {user_id: user.id}, status: Purchase.statuses[:received]).size
    
    received_count = 2148
    # Map each number to an array 123 => [1,2,3]
    received_array = received_count.to_s.chars.map(&:to_i)
    received_icon_array = Array.new
    
    received_array.each_with_index  do |number, index|
      number.times {
        received_icon_array.push icon('gift', class: "received value-#{10**(received_array.size-index-1)}")
      } if number > 0
    end
    
    received_icon_array.join("").html_safe
  end
  
  # Get user gifted icons
  def user_gifted_icons(user)
    gifted_count = user.purchases.received.size
    gifted_count = 382
    gifted_array = gifted_count.to_s.chars.map(&:to_i)
    gifted_icon_array = Array.new
    
    gifted_array.each_with_index  do |number, index|
      number.times {
        gifted_icon_array.push icon('gift', 
          class: "gifted value-#{10**(gifted_array.size-index-1)}")
      } if number > 0
    end
    
    gifted_icon_array.join("").html_safe
  end
end
