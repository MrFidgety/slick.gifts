# Fill show modal with this specific items content
$("#show-modal").html(
  "<%= j render partial: 'items/item_modal_fill', 
  object: @item, as: :item %>")
  
$("#edit-item").click ->
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

# Clear edit item form errors when submitting    
$(".edit_item").on "submit", ->
  $("form.edit_item").clear_form_errors()