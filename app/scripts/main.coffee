$ ->
  cloudContainer = $('#clouds')
  clouds = new Clouds(cloudContainer)

  mainMenu = new MainMenu($('.main-menu ul'), $('.main-menu'))

  $(document).foundation
    'magellan-expedition':
      destination_threshold: 200

      threshold: mainMenu.offset()

