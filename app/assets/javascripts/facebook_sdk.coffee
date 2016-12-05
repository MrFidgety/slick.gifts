$(document).on "page:change page:restore", ->

  $('#facebook-login').click (e) ->
    e.preventDefault()
    FB.login (response) ->
      window.location = '/auth/facebook/callback' if response.authResponse