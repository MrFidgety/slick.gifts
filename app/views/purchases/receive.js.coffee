<% if @purchase.received? %>
$('#purchase-<%= @purchase.id %>').remove()
<% end %>

# Hide the confirm modal
$('#confirm-modal').modal('hide')

# Render flash
$("#flash-container").html("<%= j render 'layouts/flash' %>")

# Display any flash
$('.alert:first').display_alert()