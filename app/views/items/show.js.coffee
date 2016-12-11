# Fill show modal with this specific items content
$("#show-modal").html(
  "<%= j render partial: 'items/show_item_modal_fill', 
  object: @item, as: :item %>")

# Show the modal
$('#show-modal').modal('show')