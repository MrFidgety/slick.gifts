<% if @item.destroyed? || @item.want.archived %>
# Hide the item modal
$('#show-modal').modal('hide')
$('#show-modal').on "hidden.bs.modal", () ->
  # Remove the item from the list
  $('#item-<%= @item.id %>').remove()
<% end %>

# Render flash
$("#flash-container").html("<%= j render 'layouts/flash' %>")

# Display any flash
$('.alert:first').display_alert()