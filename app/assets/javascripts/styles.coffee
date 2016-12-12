$(document).on "page:change page:restore", -> 

  # Render new style form errors
  $("#new_style").on "ajax:error", (e, data, status, xhr) ->
    $("form#new_style").render_form_errors('style', 
      'error-message',
      $.parseJSON(data.responseText))
      
  # Render edit style form errors
  $("#edit-modal").on "ajax:error", ".edit_style", 
  (e, data, status, xhr) ->
    $("form.edit_style").render_form_errors('style', 
      'error-message',
      $.parseJSON(data.responseText))
      
  # Clear new style form errors when submitting    
  $("#new_style").on "submit", ->
    $("form#new_style").clear_form_errors()