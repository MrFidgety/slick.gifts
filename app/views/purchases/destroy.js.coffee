<% if @purchase.destroyed? %>
# Remove from display
$('#purchase-<%= @purchase.id %>').remove()
# If no actionable gifts left, hide panel
if $("#actions-container").children(".panel-purchase").length
  # Update actions count display
  $("#actions-sentence").html("<%= j user_actions_sentence(current_user) %>")
else
  $("#actions-panel").remove()
<% end %>

# Render flash
$("#flash-container").html("<%= j render 'layouts/flash' %>")

# Display any flash
$('#flash-container .alert:first').display_alert()