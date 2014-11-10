class Movable
  constructor: ({@container}) ->
    @wrapper = $('<div>')
    @wrapper.css(
        top: @getHeight()
        width: '100%'
      )
      .appendTo(@container)

  distance: 0

  direction: -1

  scale: 1

  greatestTravelTime: 30

  position:
    top: '0%'
    left: '0%'

  drift: =>
    dfd = new $.Deferred()
    speed = @scale * (1 - @distance)
    travelTime = @greatestTravelTime / speed
    @wrapper.css(
      animation: "moveAcross #{travelTime}s linear"
      zIndex: -Math.floor(travelTime)
    )
    setTimeout =>
      dfd.resolve(this)
    , travelTime * 1000
    dfd.promise()

  getHeight: =>
    (1 - @distance) * @scale * 100 + '%'


window.Movable = Movable
