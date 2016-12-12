# Replace item in view
$('#item-<%= @item.id %>').replaceWith(
  "<%= j render @item, editable: true %>")
  
# Replace item in modal
$('#show-want-section').html(
  "<%= j render 'items/item_modal_fill_show', item: @item %>")
  
# Return to show in modal
$("#edit-want-section").hide()
$("#show-want-section").show()
$("#edit-item").html("<%= j icon('pencil-square-o') %>")
  
# Render flash
$("#flash-container").html("<%= j render 'layouts/flash' %>")
# Display any flash
$('.alert:first').display_alert()