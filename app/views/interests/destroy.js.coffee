<% if @interest.destroyed? || @interest.want.archived %>
# Hide the interest modal
$('#show-modal').modal('hide')
# Remove the interest from the list
$('#interest-<%= @interest.id %>').remove()
<% end %>
# Render flash
$("#flash-container").html("<%= j render 'layouts/flash' %>")
# Display any flash
$('.alert:first').display_alert()