<% if @purchase.gifted? %>
$('#purchase-<%= @purchase.id %>').remove()
<% end %>
# Render flash
$("#flash-container").html("<%= j render 'layouts/flash' %>")