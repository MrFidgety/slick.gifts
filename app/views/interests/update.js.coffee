# Replace item in view
$('#interest-<%= @interest.id %>').replaceWith(
  "<%= j render @interest, editable: true %>")

# Hide edit interest modal
$('#edit-modal').modal('hide')

# Render flash
$("#flash-container").html("<%= j render 'layouts/flash' %>")

# Display any flash
$('.alert:first').display_alert()