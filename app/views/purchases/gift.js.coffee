<% if @purchase.gifted? %>
$('#purchase-<%= @purchase.id %>').remove()
<% end %>

# Render flash
$("#flash-container").html("<%= j render 'layouts/flash' %>")

# Display any flash
$('#flash-container .alert:first').display_alert()