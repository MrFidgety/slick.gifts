<% if @style.destroyed? || @style.archived %>
$('#style-<%= @style.id %>').remove()
<% end %>
# Render flash
$("#flash-container").html("<%= j render 'layouts/flash' %>")