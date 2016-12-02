# Fill purchase modal with this specific items purchase form
$("#purchase-modal").html(
  "<%= j render partial: 'purchases/new', 
  object: @purchase, as: :purchase %>")

# Show the purchase modal
$('#purchase-modal').modal('show')