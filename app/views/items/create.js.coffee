# Add the new item to the users list
$("<%= j render partial: 'items/item', object: @item,
        as: :item, locals: {editable: true} %>").prependTo('#item-container')

# Hide new item modal
$('#new-item-modal').modal('hide')

# Reset new item form
$('#new_item').trigger("reset").clear_form_errors()