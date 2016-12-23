<% if @purchase.destroyed? %>
# Remove from display
$('#purchase-<%= @purchase.id %>').remove()
console.log("<%= j @actions_count - 1 %>")
# If no actionable gifts left, hide panel
# Otherwise update actions count display
<% end %>

# Render flash
$("#flash-container").html("<%= j render 'layouts/flash' %>")

# Display any flash
$('#flash-container .alert:first').display_alert()