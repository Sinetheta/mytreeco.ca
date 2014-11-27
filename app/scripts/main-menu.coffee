Magellan = Foundation.libs['magellan-expedition']

class MainMenu
  constructor: (@el, @wrapper) ->
    @addMagellanEvents()
    @wrapper.on('magellan.arrival', @onMagellanArrival)

  offset: =>
    @el.offset().top - @wrapper.offset().top

  addMagellanEvents: =>
    wrapperEl = @wrapper
    update_arrivals = Magellan.update_arrivals
    imposter = ->
      update_arrivals.apply(this, arguments)
      wrapperEl.trigger('magellan.arrival')
    Foundation.libs['magellan-expedition'].update_arrivals = imposter

  onMagellanArrival: =>
    activeArrival = @el.find(".#{Magellan.settings.active_class}")
    targetName = activeArrival.attr('data-magellan-arrival')
    $(document.body).addClass("magellan-arrived-#{targetName}")

window.MainMenu = MainMenu
