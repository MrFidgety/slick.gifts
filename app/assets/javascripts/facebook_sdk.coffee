$(document).on "page:change page:restore", ->

  $('#facebook-login').click (e) ->
    e.preventDefault()
    FB.login (response) ->
      window.location = '/users/auth/facebook' if response.authResponse
    , {scope: 'email,public_profile,user_friends'})