$(document).on "page:change page:restore", ->
  if $('.pagination').length
    $(window).scroll ->
      url = $('.pagination .next_page a').attr('href')
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 400 
        $('.pagination').html('<i class="fa fa-cog fa-spin fa-2x fa-fw"></i>')
        return $.getScript(url)
    return $(window).scroll()