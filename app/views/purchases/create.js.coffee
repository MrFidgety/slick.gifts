# Add new purcahse to want purchases section
$("<%= j render @purchase %>").prependTo('#want-purchases-section')
  
# Return to show in modal
$("#purchase-want-section").hide()
$("#show-want-section").show()
$("#purchase-want").html("I've got this!")

# Render flash
$("#flash-container").html("<%= j render 'layouts/flash' %>")
# Display any flash
$('.alert:first').display_alert()