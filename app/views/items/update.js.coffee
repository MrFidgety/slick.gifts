# Replace item in view
$('#item-<%= @item.id %>').replaceWith(
  "<%= j render partial: 'items/item', object: @item,
          as: :item, locals: {editable: true} %>")

# Hide edit item modal
$('#edit-item-modal').modal('hide')