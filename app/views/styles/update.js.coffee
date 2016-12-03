# Replace item in view
$('#style-<%= @style.id %>').replaceWith(
  "<%= j render @style, editable: true %>")

$('#edit-modal').modal('hide')