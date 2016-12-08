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
    message = link.attr 'data-message'
    confirm = link.attr 'data-confirm'
    html = 
    """
      <div class="modal fade">
        <div class="modal-dialog">
          <div class="modal-content confirm-modal">
            <div class="modal-header">
              <h4 class="modal-title">#{title}</h4>
            </div>
            <div class="modal-body">
              <p>#{message}</p>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default confirm-modal-button">#{confirm}</button>
            </div>
          </div>
        </div>
      </div>
    """
    $(html).modal()
      .on 'shown.bs.modal', ->
        $(this).find('.confirm-modal-button').on 'click', -> 
          $.rails.confirmed(link)
          $(this).('hide')
      .on 'hidden.bs.modal', -> 
        $(@).remove()