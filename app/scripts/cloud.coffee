class Cloud extends Movable
  constructor: ({@parent}) ->
    @distance = Math.random()
    super({container: @parent})
    @template = @getTemplate()
    @element = $(@template)
    scale = (1 - 0.6 * @distance)
    @element.css(
        transform: "scale(#{scale}, #{scale})"
      )
      .appendTo(@wrapper)

  getTemplate: ->
    numberOfCloudFiles = 6
    n = Math.floor(Math.random() * numberOfCloudFiles)
    "<div class='cloud cloud#{n}'></div>"

window.Cloud = Cloud
