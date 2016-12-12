# Fill show modal with this specific items content
$("#show-modal").html(
  "<%= j render partial: 'items/item_modal_fill', 
  object: @item, as: :item %>")
  
$("#edit-want").click ->
  if $("#show-want-section").is(':visible')
    $("#show-want-section").hide()
    $("#edit-want-section").show()
    $("#edit-want").html("<%= j icon('undo') %>")
  else
    $("#edit-want-section").hide()
    $("#show-want-section").show()
    $("#edit-want").html("<%= j icon('pencil-square-o') %>")
    
$("#purchase-want").click ->
  if $("#show-want-section").is(':visible')
    $("#show-want-section").hide()
    $("#purchase-want-section").show()
    $("#purchase-want").html("<%= j icon('undo') %>")
  else
    $("#purchase-want-section").hide()
    $("#show-want-section").show()
    $("#purchase-want").html("j <%= icon('gift') %> I've got this")

# Show the modal
$('#show-modal').modal('show')

# Clear edit item form errors when submitting    
$(".edit_item").on "submit", ->
  $("form.edit_item").clear_form_errors()
  
# Show delete confirm
$("#delete-item").click ->
  $("#delete-confirm").toggle()