# Replace style in view
$('#style-<%= @style.id %>').replaceWith(
  "<%= j render @style, editable: true %>")
  
# Replace item in modal
$('#want-details-section').html(
  "<%= j render 'styles/style_modal_fill_show', style: @style %>")
  
# Return to show in modal
$("#edit-want-section").hide()
$("#show-want-section").show()
$("#edit-want").html("<%= j icon('pencil-square-o') %>")

# Render flash
$("#flash-container").html("<%= j render 'layouts/flash' %>")
# Display any flash
$('.alert:first').display_alert()