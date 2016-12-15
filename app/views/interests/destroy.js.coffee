<% if @interest.destroyed? || @interest.want.archived %>
# Hide the interest modal
$('#show-modal').modal('hide')
# Remove the interest from the list
$('#interest-<%= @interest.id %>').remove()
# Update the users wants sentence
$("#wants-sentence").html("<%= j user_wants_sentence(@interest.user) %>")
<% end %>
# Render flash
$("#flash-container").html("<%= j render 'layouts/flash' %>")
# Display any flash
$('#flash-container .alert:first').display_alert()