<% if @item.destroyed? || @item.want.archived %>
$('#item-<%= @item.id %>').remove()
<% end %>

# Render flash
$("#flash-container").html("<%= j render 'layouts/flash' %>")

# Display any flash
$('.alert:first').display_alert()