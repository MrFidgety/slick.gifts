# Fill show modal with this specific items content
$("#show-modal").html(
  "<%= j render partial: 'items/item_modal_fill', 
  object: @item, as: :item %>")
  
$("#edit-item").click ->
  console.log('edit button clicked')
  if $("#show-want-section").is(':visible')
    $("#show-want-section").hide()
    $("#edit-want-section").show()
    $("#edit-item").html("<%= j icon('undo') %>")
  else
    $("#edit-want-section").hide()
    $("#show-want-section").show()
    $("#edit-item").html("<%= j icon('pencil-square-o') %>")

# Show the modal
$('#show-modal').modal('show')