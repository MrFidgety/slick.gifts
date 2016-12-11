# Fill show modal with this specific items content
$("#show-modal").html(
  "<%= j render partial: 'items/show_item_modal_fill', 
  object: @item, as: :item %>")
  
$("#edit-item").click ->
  console.log("edit clicked")

# Show the modal
$('#show-modal').modal('show')