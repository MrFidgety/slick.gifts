# Fill item modal with this specific items edit form
$("#edit-item-modal").html(
  "<%= j render partial: 'items/edit_item_modal_fill', 
  object: @item, as: :item %>")

# Show the edit modal
$('#edit-item-modal').modal('show')