# Replace item in view
$('#item-<%= @item.id %>').replaceWith(
  "<%= j render @item, editable: true %>")

$('#edit-modal').modal('hide')