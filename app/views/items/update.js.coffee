# Replace item in view
$('#item-<%= @item.id %>').replaceWith(
  "<%= j render @item, editable: true %>")
  
# Hide edit modal
$('#edit-modal').modal('hide')

# Render flash
$("#flash-container").html("<%= j render 'layouts/flash' %>")

# Display any flash
$('.alert:first').display_alert()