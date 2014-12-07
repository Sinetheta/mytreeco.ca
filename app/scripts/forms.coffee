ajaxFormSubmit = (event) ->
  event.preventDefault()
  target = $(event.target)
  action = target.attr('action')
  data = target.serialize()
  successModalId = target.attr('success-modal-id')
  $.post(action, data)
  # we expect the post to throw a CORS error anyways
  # so no use waiting around
  $("##{successModalId}").foundation('reveal', 'open')

$ ->
  window.onsubmit = ajaxFormSubmit

  $('[close-reveal-modal]').on 'click', ->
    $(this).closest('.reveal-modal').foundation('reveal', 'close')
