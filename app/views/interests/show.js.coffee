# Fill show modal with this specific items content
$("#show-modal").html(
  "<%= j render partial: 'interests/interest_modal_fill', 
  object: @interest, as: :interest %>")
  
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
$(".edit_interest").on "submit", ->
  $("form.interest_item").clear_form_errors()
  
# Show delete confirm
$("#delete-interest").click ->
  $("#delete-confirm").toggle()
  
# Render new purchase form errors
$("#new_purchase").on "ajax:error", (e, data, status, xhr) ->
  $("form#new_purchase").render_form_errors('purchase', 
    'error-message',
    $.parseJSON(data.responseText))
   
# Clear new purchase form errors when submitting    
$("#new_purchase").on "submit", ->
  $("form#new_purchase").clear_form_errors()