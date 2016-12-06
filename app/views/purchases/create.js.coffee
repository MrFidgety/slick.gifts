# Hide purchase modal
$('#purchase-modal').modal('hide')

# Render flash
$("#flash-container").html("<%= j render 'layouts/flash' %>")

# Display any flash
$('.alert:first').display_alert()