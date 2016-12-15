$(document).on "page:change page:restore", ->
  
  # Display loader when loading a want
  $("#want-container").on 'click',".show-want", ->
    $("#show-modal").html('<div class="modal-loader"><i class="fa fa-cog fa-spin fa-2x fa-fw"></i></div>')
    # Show the modal
    $('#show-modal').modal('show')
  
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
    # Remove this alert if clicked
    $(this).click ->
      $(this).remove_alert()
    # Show then hide this alert
    $(this).show(0).delay(5000).hide(0, () ->
      $(this).remove_alert()
    )
  
  $.fn.remove_alert = () ->
    # Trigger next alert to display
    $(this).next().display_alert()
    # Remove current alert
    $(this).remove()

  $('#flash-container .alert:first').display_alert()
  
  # Facebook share link
  $("#fb-share-button").click ->
    FB.ui({
      method: 'share',
      mobile_iframe: true,
      href: window.location.href,
    }, -> (response){})