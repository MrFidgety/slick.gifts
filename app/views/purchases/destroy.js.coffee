<% if @purchase.destroyed? %>
# Remove from display
$('#purchase-<%= @purchase.id %>').remove()
console.log("<%= j actions_count - 1 %>")
# If no actionable gifts left, hide panel
#$('#actions-panel %>').remove()
# Otherwise update actions count display
#$("#actions-count-display").html("<%= j actions_count.humanize} #{"gift".pluralize(actions_count)}" %>")
<% end %>

# Render flash
$("#flash-container").html("<%= j render 'layouts/flash' %>")

# Display any flash
$('#flash-container .alert:first').display_alert()