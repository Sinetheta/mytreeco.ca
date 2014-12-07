initFoundation = (threshold) ->
  $(document).foundation
    'magellan-expedition':
      destination_threshold: 200
      threshold: threshold

$ ->
  cloudContainer = $('#clouds')
  clouds = new Clouds(cloudContainer)

  mainMenu = new MainMenu($('.main-menu ul'), $('.main-menu'))
  threshold = mainMenu.offset()

  initFoundation(threshold)
  $(document).on 'close.fndtn.reveal', ->
    initFoundation(threshold)
