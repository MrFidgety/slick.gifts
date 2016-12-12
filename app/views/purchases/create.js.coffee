# Add new purcahse to want purchases section
$("<%= j render @purchase %>").prependTo('#want-purchases-section')
  
# Return to show in modal
$("#edit-want-section").hide()
$("#show-want-section").show()
$("#edit-want").html("I've got this!")

# Render flash
$("#flash-container").html("<%= j render 'layouts/flash' %>")
# Display any flash
$('.alert:first').display_alert()