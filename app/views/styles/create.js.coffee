# Add the new style to the users list
$("<%= j render @style, editable: true %>").prependTo('#want-container')

# Hide new style modal
$('#new-style-modal').modal('hide')

# Reset new style form
$('#new_style').trigger("reset").clear_form_errors()