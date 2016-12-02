# Fill purchase modal with this specific items purchase form
$("#purchase-item-modal").html(
  "<%= j render partial: 'purchase/new', 
  object: @purchase, as: :purchase %>")

# Show the purchase modal
$('#purchase-item-modal').modal('show')