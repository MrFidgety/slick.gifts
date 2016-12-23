$('#friends-container').append('<%= j render @friends %>')
<% if @friends.next_page %>
$('.pagination').replaceWith('<%= j will_paginate @friends %>')
<% else %>
$(window).off('scroll')
$('.pagination').remove()
<% end %>