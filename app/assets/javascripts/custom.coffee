$(document).on "page:change page:restore", ->
  
  # Render errors on failed AJAX
  $.fn.render_form_errors = (model_name, error_class, errors) ->
    form = this
    form.clear_form_errors()
    
    $.each(errors, (field, messages) ->
      error = $('<small class="'+error_class+'">'+messages[0]+'</small>').hide()
      element = form.find('#' + model_name + '_' + field)
      element.wrap('<div class="has-error"></div>')
      element.parent().append(error)
      error.fadeIn(300)
    )
  
  # Clear form errors
  $.fn.clear_form_errors = () ->
    form = this
    form.find('.error-message').unwrap()
    form.find('.error-message').remove()