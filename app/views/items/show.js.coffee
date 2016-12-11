# Fill show modal with this specific items content
$("#show-modal").html(
  "<%= j render partial: 'items/show_item_modal_fill', 
  object: @item, as: :item %>")
  
$("#edit-item").click ->
  $("#edit-item").disable(true)
  if $("#view-want-section").is(':visible')
    $("#view-want-section").slideUp "fast", () ->
      $("#edit-want-section").slideDown "fast", () ->
        $("#edit-item").disable(false)
  else
     $("#edit-want-section").slideUp "fast", () ->
      $("#view-want-section").slideDown "fast", () ->
        $("#edit-item").disable(false)

# Show the modal
$('#show-modal').modal('show')