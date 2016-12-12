$(document).on "page:change page:restore", -> 

  # Render new item form errors
  $("#new_item").on "ajax:error", (e, data, status, xhr) ->
    $("form#new_item").render_form_errors('item', 
      'error-message',
      $.parseJSON(data.responseText))
  
  # Clear new item form errors when submitting    
  $("#new_item").on "submit", ->
    $("#new_item form").clear_form_errors()
      
  # Render edit form errors
  $("#show-modal").on "ajax:error", ".edit_item", 
  (e, data, status, xhr) ->
    $("form.edit_item").render_form_errors('item', 
      'error-message',
      $.parseJSON(data.responseText))
     
  # Clear edit item form errors when submitting    
  $(".edit_item").on "submit", ->
    $(".edit_item form").clear_form_errors()