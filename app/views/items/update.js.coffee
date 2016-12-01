# Replace item in view
$('#item-<%= @item.id %>').replaceWith("<%= j render @item %>")

# Hide edit item modal
$('#edit-item-modal').modal('hide')