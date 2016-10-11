class Subscriptions
  constructor: (el)->
    @el = el
    @$el = $(el)

    @subscribe_button = $(".subscribe-button", @$el)
    @unsubscribe_button = $(".unsubscribe-button", @$el)

    @bindings()

  bindings: (el)->

    @subscribe_button.on "click",  @subscribeHandler
    @unsubscribe_button.on "click", @unsubscribeHandler

  subscribeHandler: (event)=>
    event.preventDefault()

    url = @subscribe_button.attr("href")

    $.ajax(
      url: url
      method: "POST"
      dataType: "json"
      success: =>
        @subscribe_button.hide()
        @unsubscribe_button.show()
      )

  unsubscribeHandler: (event)=>
    event.preventDefault()
    url = @unsubscribe_button.attr("href")

    $.ajax(
      url: url
      method: "DELETE"
      dataType: "json"
      success: =>
        @unsubscribe_button.hide()
        @subscribe_button.show()
      )

 $ ->
  new Subscriptions(".subscription-block")
