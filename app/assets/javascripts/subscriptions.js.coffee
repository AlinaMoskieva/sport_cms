class Subscriptions
  constructor: (el)->
    @el = el
    @$el = $(el)

    @subscribeStatus = $(".subscriptions__buttons", @$el).parent()
    @subscribeButton = $(".subscriptions__subscribe-button", @$el)
    @unsubscribeButton = $(".subscriptions__unsubscribe-button", @$el)

    @bindings()

  bindings: (el)->
    @subscribeButton.on "click",  @subscribeHandler
    @unsubscribeButton.on "click", @unsubscribeHandler

  subscribeHandler: (event)=>
    event.preventDefault()

    url = @subscribeButton.attr("href")

    $.ajax(
      url: url
      method: "POST"
      dataType: "json"
      success: (returnedData) =>
        @subscribeStatus.addClass("subscriptions--subscribed")
        @id = returnedData.id
      )

  unsubscribeHandler: (event)=>
    event.preventDefault()
    url = @unsubscribeButton.attr("href")

    $.ajax(
      url: @url()
      method: "DELETE"
      dataType: "json"
      success: =>
        @subscribeStatus.removeClass("subscriptions--subscribed")
      )
  url: ->
    if @id?
      @generateURL()
    else
      @unsubscribeButton.attr("href")

  generateURL: ->
    url = @unsubscribeButton.attr("href").split("/")
    url[3] = "subscriptions"
    url[4] = @id
    url.join("/")

 $ ->
  new Subscriptions(".subscriptions")
