# Replace item in view
$('#interest-<%= @interest.id %>').replaceWith(
  "<%= j render @interest, editable: true %>")

$('#edit-modal').modal('hide')