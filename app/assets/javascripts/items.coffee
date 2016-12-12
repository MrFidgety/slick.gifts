$(document).on "page:change page:restore", -> 

  # Render new item form errors
  $("#new_item").on "ajax:error", (e, data, status, xhr) ->
    $("form#new_item").render_form_errors('item', 
      'error-message',
      $.parseJSON(data.responseText))
  
  # Render edit form errors
  $("#show-modal").on "ajax:error", ".edit_item", 
  (e, data, status, xhr) ->
    $("form.edit_item").render_form_errors('item', 
      'error-message',
      $.parseJSON(data.responseText))