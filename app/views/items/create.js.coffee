# Add the new item to the users list
$("<%= j render @item, editable: true %>").prependTo('#want-container')

# Hide new item modal
$('#new-item-modal').modal('hide')

# Reset new item form
$('#new_item').trigger("reset").clear_form_errors()

# Render flash
$("#flash-container").html("<%= j render 'layouts/flash' %>")

# Display any flash
$('.alert:first').display_alert()