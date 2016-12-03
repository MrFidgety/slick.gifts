$(document).on "page:change page:restore", -> 

  # Render new item form errors
  $("#new_style").on "ajax:error", (e, data, status, xhr) ->
    $("form#new_style").render_form_errors('style', 
      'error-message',
      $.parseJSON(data.responseText))
      
  # Render edit form errors
  $("#edit-modal").on "ajax:error", ".edit_style", 
  (e, data, status, xhr) ->
    $("form.edit_style").render_form_errors('style', 
      'error-message',
      $.parseJSON(data.responseText))