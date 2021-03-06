$(document).on "page:change page:restore", ->
  
  $.rails.allowAction = (link) ->
    return true unless link.attr('data-confirm')
    $.rails.showConfirmDialog(link) 
    false 

  $.rails.confirmed = (link) ->
    link.removeAttr('data-confirm')
    link.trigger('click.rails')

  $.rails.showConfirmDialog = (link) ->
    title = link.attr 'data-title'
    icon = link.attr 'data-icon'
    color = link.attr 'data-color'
    message = link.attr 'data-message'
    confirm = link.attr 'data-confirm'
    html = 
    """
      <div id="confirm-modal" class="modal fade">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title"><i class="fa fa-#{icon}"></i> #{title}</h4>
            </div>
            <div class="modal-body">
              <p>#{message}</p>
              <button type="button" class="btn btn-link #{color} btn-block confirm-modal-button">#{confirm}</button>
            </div>
          </div>
        </div>
      </div>
    """
    $(html).modal()
      .on 'shown.bs.modal', ->
        $(this).find('.confirm-modal-button').on 'click', -> 
          $.rails.confirmed(link)
          $('#confirm-modal').modal('hide')
      .on 'hidden.bs.modal', -> 
        $(@).remove()