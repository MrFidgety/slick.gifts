$(document).on "page:change page:restore", -> 

  # Render new interest form errors
  $("#new_interest").on "ajax:error", (e, data, status, xhr) ->
    $("form#new_interest").render_form_errors('interest', 
      'error-message',
      $.parseJSON(data.responseText))
      
  # Render edit interest form errors
  $("#edit-modal").on "ajax:error", ".edit_interest", 
  (e, data, status, xhr) ->
    $("form.edit_interest").render_form_errors('interest', 
      'error-message',
      $.parseJSON(data.responseText))
      
  # Clear new interest form errors when submitting    
  $("#new_interest").on "submit", ->
    $("form#new_interest").clear_form_errors()