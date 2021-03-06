# Replace item in view
$('#item-<%= @item.id %>').replaceWith(
  "<%= j render @item, editable: true %>")
  
# Replace item in modal
$('#want-details-section').html(
  "<%= j render 'items/item_modal_fill_show', item: @item %>")
  
# Return to show in modal
$("#edit-want-section").hide()
$("#show-want-section").show()
$("#edit-want").html("<%= j icon('pencil-square-o') %>")

# Render flash
$("#flash-container").html("<%= j render 'layouts/flash' %>")
# Display any flash
$('#flash-container .alert:first').display_alert()