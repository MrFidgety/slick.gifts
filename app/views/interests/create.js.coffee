# Add the new interest to the users list
$("<%= j render @interest, editable: true %>").prependTo('#want-container')

# Remove the alert if there were no wants
$("#no-wants-alert").hide()

# Update the users wants sentence
$("#wants-sentence").html("<%= j user_wants_sentence(@interest.user) %>")

# Hide new interest modal
$('#new-interest-modal').modal('hide')

# Reset new interest form
$('#new_interest').trigger("reset").clear_form_errors()

# Render flash
$("#flash-container").html("<%= j render 'layouts/flash' %>")

# Display any flash
$('#flash-container .alert:first').display_alert()