$ ->
  cloudContainer = $('#clouds')
  clouds = new Clouds(cloudContainer)

  menuOffset = $('.main-menu ul').offset().top - $('.main-menu').offset().top

  $(document).foundation
    'magellan-expedition':
      destination_threshold: 200
      threshold: menuOffset

