# Fill edit modal with this specific styles edit form
$("#edit-modal").html(
  "<%= j render partial: 'styles/edit_style_modal_fill', 
  object: @style, as: :style %>")

# Show the edit modal
$('#edit-modal').modal('show')