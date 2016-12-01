# Add the new item to the users list
$("<%= j render @item %>").prependTo('#item-container')

# Hide new item modal
$('#new-item-modal').modal('hide')

# Reset new item form
$('#new_item').trigger("reset").clear_form_errors()