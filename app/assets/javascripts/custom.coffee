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
    
  $.fn.display_alert = () ->
    $(this).show
    timeout = window.setTimeout($(this).remove_alert, 3000)
    $(this).data('timeout', timeout)
    
  $.fn.remove_alert = () ->
    $(this).hide
    window.clearTimeout($(this).data('timeout'))
    $(this).next().display_alert
    
  $('.alert').click ->
    console.log('clicked flash message')
    $(this).remove_alert
    
  $('.alert:first').display_alert
    