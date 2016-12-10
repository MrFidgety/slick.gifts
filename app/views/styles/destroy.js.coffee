<% if @style.destroyed? || @style.want.archived %>
$('#style-<%= @style.id %>').remove()
<% end %>

# Render flash
$("#flash-container").html("<%= j render 'layouts/flash' %>")

# Display any flash
$('.alert:first').display_alert()