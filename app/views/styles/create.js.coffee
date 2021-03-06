# Add the new style to the users list
$("<%= j render @style, editable: true %>").prependTo('#want-container')

# Remove the alert if there were no wants
$("#no-wants-alert").hide()

# Update the users wants sentence
$("#wants-sentence").html("<%= j user_wants_sentence(@style.user) %>")

# Hide new style modal
$('#new-style-modal').modal('hide')

# Reset new style form
$('#new_style').trigger("reset").clear_form_errors()

# Render flash
$("#flash-container").html("<%= j render 'layouts/flash' %>")

# Display any flash
$('#flash-container .alert:first').display_alert()