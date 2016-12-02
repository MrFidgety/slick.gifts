$(document).on "page:change page:restore", -> 

  # Render new item form errors
  $("#new_item").on "ajax:error", (e, data, status, xhr) ->
    $("form#new_item").render_form_errors('item', 
      'error-message',
      $.parseJSON(data.responseText))
  
  # Render edit form errors
  $("#edit-modal").on "ajax:error", ".edit_item, .edit_interest, .edit_style", 
  (e, data, status, xhr) ->
    $("form.edit_item").render_form_errors('item', 
      'error-message',
      $.parseJSON(data.responseText))
    $("form.edit_interest").render_form_errors('interest', 
      'error-message',
      $.parseJSON(data.responseText))
    $("form.edit_style").render_form_errors('style', 
      'error-message',
      $.parseJSON(data.responseText))