# Add new purcahse to want purchases section
$("<%= j render @purchase %>").prependTo('#want-purchases-section')
  
# Return to show in modal
$("#purchase-want-section").hide()
$("#show-want-section").show()
$("#purchase-want").html("I've got this!")

# Reset purchase form
$("#purchase-want-section").html("<%= render 'purchases/new', want: @want, purchase: @purchase_new %>")

# Render flash
$("#flash-container").html("<%= j render 'layouts/flash' %>")
# Display any flash
$('.alert:first').display_alert()