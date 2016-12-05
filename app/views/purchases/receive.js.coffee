<% if @purchase.received? || @purchase.not_received? %>
$('#purchase-<%= @purchase.id %>').remove()
<% end %>
# Render flash
$("#flash-container").html("<%= j render 'layouts/flash' %>")