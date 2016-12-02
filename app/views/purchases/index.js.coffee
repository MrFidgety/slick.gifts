# Fill purchases modal with this specific items purchases
$("#purchases-modal").html(
  "<%= j render partial: 'purchases/index', 
  object: @purchases, as: :purchases %>")

# Show the purchases modal
$('#purchases-modal').modal('show')