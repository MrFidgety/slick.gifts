<% if @item.destroyed? || @item.archived %>
$('#item-<%= @item.id %>').remove()
<% end %>
# Render flash
$("#flash-container").html("<%= j render 'layouts/flash' %>")