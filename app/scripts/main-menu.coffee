class MainMenu
  constructor: (@el, @wrapper) ->

  offset: ->
    @el.offset().top - @wrapper.offset().top

window.MainMenu = MainMenu
