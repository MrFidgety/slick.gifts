# Replace interest in view
$('#interest-<%= @interest.id %>').replaceWith(
  "<%= j render @interest, editable: true %>")
  
# Replace interest in modal
$('#want-details-section').html(
  "<%= j render 'interest/interest_modal_fill_show', interest: @interest %>")
  
# Return to show in modal
$("#edit-want-section").hide()
$("#show-want-section").show()
$("#edit-want").html("<%= j icon('pencil-square-o') %>")

# Render flash
$("#flash-container").html("<%= j render 'layouts/flash' %>")
# Display any flash
$('.alert:first').display_alert()