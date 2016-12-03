$(document).on "page:change page:restore", -> 

  # Render new item form errors
  $("#new_interest").on "ajax:error", (e, data, status, xhr) ->
    $("form#new_interest").render_form_errors('interest', 
      'error-message',
      $.parseJSON(data.responseText))
      
  # Render edit form errors
  $("#edit-modal").on "ajax:error", ".edit_interest", 
  (e, data, status, xhr) ->
    $("form.edit_interest").render_form_errors('interest', 
      'error-message',
      $.parseJSON(data.responseText))