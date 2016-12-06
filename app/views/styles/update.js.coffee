# Replace item in view
$('#style-<%= @style.id %>').replaceWith(
  "<%= j render @style, editable: true %>")

# Hide edit modal
$('#edit-modal').modal('hide')

# Render flash
$("#flash-container").html("<%= j render 'layouts/flash' %>")

# Display any flash
$('.alert:first').display_alert()