$(document).on "page:change page:restore", -> 

  # Render new purchase form errors
  $("#new_purchase").on "ajax:error", (e, data, status, xhr) ->
    $("form#new_purchase").render_form_errors('ourchase', 
      'error-message',
      $.parseJSON(data.responseText))
     
  # Clear new item form errors when submitting    
  $("#new_purchase").on "submit", ->
    $("form#new_purchase").clear_form_errors()