# Fill edit modal with this specific items edit form
$("#edit-modal").html(
  "<%= j render partial: 'items/edit_item_modal_fill', 
  object: @item, as: :item %>")

# Show the edit modal
$('#edit-modal').modal('show')