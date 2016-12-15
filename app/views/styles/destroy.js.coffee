<% if @style.destroyed? || @style.want.archived %>
# Hide the item modal
$('#show-modal').modal('hide')
# Remove the item from the list
$('#style-<%= @style.id %>').remove()
# Update the users wants sentence
$("#wants-sentence").html("<%= j user_wants_sentence(@style.user) %>")
<% end %>
# Render flash
$("#flash-container").html("<%= j render 'layouts/flash' %>")
# Display any flash
$('#flash-container .alert:first').display_alert()