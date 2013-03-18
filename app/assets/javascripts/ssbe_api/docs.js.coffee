class Docs
  constructor: ->
    @hideContent()
    @initializeEventHandlers()

  hideContent: =>
    $('.content').hide()

  initializeEventHandlers: =>
    $('.heading').click (event) ->
      $(@).parent().find('.content').toggle()

$ ->
  new Docs
