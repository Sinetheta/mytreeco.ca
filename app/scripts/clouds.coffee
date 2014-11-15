class Clouds
  constructor: (@element) ->
    @prepopulateClouds()
    @startClouds()

  _store: []

  maxWait: 15

  add: (cloud) =>
    @_store.push(cloud)

  createCloud: (progress) =>
    cloud = new Cloud({parent: @element})
    @add(cloud)
    cloud.drift(progress).then =>
      @remove(cloud)

  startClouds: =>
    @createCloud()
    @_timeout = setTimeout(@startClouds, @maxWait * 1000 * Math.random())

  stopClouds: =>
    clearTimeout(@_timeout)

  remove: (cloud) =>
    cloud.wrapper.remove()
    @_store = @_store.filter (member) ->
      member is not cloud

  prepopulateClouds: =>
    @createCloud(Math.random()) for num in [0...3]

window.Clouds = Clouds
