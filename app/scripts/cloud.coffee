class Cloud extends Movable
  constructor: ({@parent}) ->
    @distance = Math.random()
    super({container: @parent})
    @template = @getRandomTemplate()
    @element = $(@template)
    scale = (1 - 0.6 * @distance)
    @element.css(
        transform: "scale(#{scale}, #{scale})"
      )
      .appendTo(@wrapper)

  templates: [
    '<div class="cloud1"></div>'
    '<div class="cloud2"></div>'
  ]

  getRandomTemplate: =>
    @templates[Math.floor(Math.random() * @templates.length)]


window.Cloud = Cloud
