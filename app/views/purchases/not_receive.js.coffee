<% if @purchase.not_received? %>
# Remove from display
$('#purchase-<%= @purchase.id %>').remove()
# Update actions count display
$("#actions-sentence").html("<%= j user_actions_sentence(current_user) %>")
<% end %>

# Render flash
$("#flash-container").html("<%= j render 'layouts/flash' %>")

# Display any flash
$('#flash-container .alert:first').display_alert()