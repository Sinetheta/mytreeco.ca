class Clouds
  constructor: (@element) ->
    @startClouds()

  _store: []

  maxWait: 15

  add: (cloud) =>
    @_store.push(cloud)

  startClouds: =>
    cloud = new Cloud({parent: @element})
    @add(cloud)
    cloud.drift().then =>
      @remove(cloud)
    @_timeout = setTimeout(@startClouds, @maxWait * 1000 * Math.random())

  stopClouds: =>
    clearTimeout(@_timeout)

  remove: (cloud) =>
    cloud.wrapper.remove()
    @_store = @_store.filter (member) ->
      member is not cloud


window.Clouds = Clouds
