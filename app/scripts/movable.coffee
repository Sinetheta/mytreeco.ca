class Movable
  constructor: ({@container}) ->
    @wrapper = $(@template)
    @wrapper.css(
        top: @distance * 100 + '%'
        width: '100%'
      )
      .appendTo(@container)

  template: '<div class="cloud-wrapper">'

  distance: 0

  direction: -1

  greatestTravelTime: 30

  position:
    top: '0%'
    left: '0%'

  drift: (progress = 0) =>
    dfd = new $.Deferred()
    speed = 1 - @distance
    travelTime = @greatestTravelTime / speed
    animationDelay = Math.floor(-progress * travelTime)
    @wrapper.css(
      zIndex: -Math.floor(travelTime)
      animation: "moveAcross #{travelTime}s linear"
      'animation-delay': "#{animationDelay}s"
      '-moz-animation-delay': "#{animationDelay}s"
      '-webkit-animation-delay': "#{animationDelay}s"
    )
    setTimeout =>
      dfd.resolve(this)
    , (travelTime + animationDelay) * 1000
    dfd.promise()


window.Movable = Movable
