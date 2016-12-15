$(document).on "page:change page:restore", ->

  $('.facebook-login-button').click (e) ->
    e.preventDefault()
    FB.login (response) ->
      window.location = '/users/auth/facebook' if response.authResponse
    , {scope: 'email,public_profile,user_friends'}
    
$ ->
  loadFacebookSDK()
  bindFacebookEvents() unless window.fbEventsBound

bindFacebookEvents = ->
  $(document)
    .on('page:fetch', saveFacebookRoot)
    .on('page:change', restoreFacebookRoot)
    .on('page:load', ->
      FB?.XFBML.parse()
    )
  @fbEventsBound = true

saveFacebookRoot = ->
  if $('#fb-root').length
    @fbRoot = $('#fb-root').detach()

restoreFacebookRoot = ->
  if @fbRoot?
    if $('#fb-root').length
      $('#fb-root').replaceWith @fbRoot
    else
      $('body').append @fbRoot

loadFacebookSDK = ->
  window.fbAsyncInit = initializeFacebookSDK
  $.getScript("//connect.facebook.net/en_US/sdk.js")

initializeFacebookSDK = ->
  FB.init
    appId  : '<%= ENV["FACEBOOK_API_KEY"] %>'
    status : true
    cookie : true
    xfbml  : true
    version: 'v2.8'