<% if @interest.destroyed? || @interest.archived %>
$('#interest-<%= @interest.id %>').remove()
<% end %>
# Render flash
$("#flash-container").html("<%= j render 'layouts/flash' %>")