# Fill show modal with this specific items content
$("#show-modal").html(
  "<%= j render partial: 'styles/style_modal_fill', 
  object: @style, as: :style %>")
  
$("#edit-want").click ->
  if $("#show-want-section").is(':visible')
    $("#show-want-section").hide()
    $("#edit-want-section").show()
    $("#edit-want").html("<%= j icon('arrow-left') %>")
  else
    $("#edit-want-section").hide()
    $("#show-want-section").show()
    $("#edit-want").html("<%= j icon('pencil-square-o') %>")
    
$("#purchase-want").click ->
  if $("#show-want-section").is(':visible')
    $("#show-want-section").hide()
    $("#purchase-want-section").show()
    $("#purchase-want").html("<%= j icon('arrow-left') %>")
  else
    $("#purchase-want-section").hide()
    $("#show-want-section").show()
    $("#purchase-want").html("I've got this!")

# Clear edit item form errors when submitting    
$(".edit_style").on "submit", ->
  $("form.edit_style").clear_form_errors()
  
# Show delete confirm
$("#delete-style").click ->
  $("#delete-confirm").toggle()