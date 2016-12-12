# Fill show modal with this specific items content
$("#show-modal").html(
  "<%= j render partial: 'items/item_modal_fill', 
  object: @item, as: :item %>")
  
$("#edit-item").click ->
  # $("#edit-item").attr('disabled','disabled')
  if $("#show-want-section").is(':visible')
    # $("#view-want-section").slideUp "fast", () ->
    #   $("#edit-want-section").slideDown "fast", () ->
    #     $("#edit-item").removeAttr('disabled')
    $("#show-want-section").hide()
    $("#edit-want-section").show()
    $("#edit-item").html("<%= j icon('undo') %>")
  else
    # $("#edit-want-section").slideUp "fast", () ->
    #   $("#view-want-section").slideDown "fast", () ->
    #     $("#edit-item").removeAttr('disabled')
    $("#edit-want-section").hide()
    $("#show-want-section").show()
    $("#edit-item").html("<%= j icon('pencil-square-o') %>")

# Show the modal
$('#show-modal').modal('show')