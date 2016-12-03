# Fill edit modal with this specific items edit form
$("#edit-modal").html(
  "<%= j render partial: 'interests/edit_interest_modal_fill', 
  object: @interest, as: :interest %>")

# Show the edit modal
$('#edit-modal').modal('show')