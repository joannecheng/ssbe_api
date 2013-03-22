class Docs
  constructor: ->
    @hideContent()
    @initializeEventHandlers()

  hideContent: =>
    $('.content').hide()

  initializeEventHandlers: =>
    $('.heading').click (event) ->
      event.preventDefault()
      $(@).parent().find('.content').toggle()

$ ->
  new Docs
