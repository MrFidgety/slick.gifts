# Add the new interest to the users list
$("<%= j render @interest, editable: true %>").prependTo('#want-container')

# Hide new interest modal
$('#new-interest-modal').modal('hide')

# Reset new interest form
$('#new_interest').trigger("reset").clear_form_errors()