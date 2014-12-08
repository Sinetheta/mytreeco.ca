initFoundation = (threshold) ->
  $(document).foundation
    'magellan-expedition':
      destination_threshold: 100
      threshold: threshold

$ ->
  Movable.addKeyframe($(document.body).width())
  $(window).resize ->
    Movable.addKeyframe($(document.body).width())

  # If we don't wait for the next turn of the event loop Safari doesn't
  # acknowledge the keyframe animation, and the initial clouds are "stuck"
  setTimeout ->
    cloudContainer = $('#clouds')
    clouds = new Clouds(cloudContainer)

  mainMenu = new MainMenu($('.main-menu ul'), $('.main-menu'))
  threshold = mainMenu.offset()

  initFoundation(threshold)
  $(document).on 'close.fndtn.reveal', ->
    initFoundation(threshold)
