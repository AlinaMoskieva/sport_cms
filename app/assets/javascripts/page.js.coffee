class Page
  constructor: (el)->
    @el = el
    @$el =$(el)

    @like_button = $(".like-button", @$el)
    @likes = $(".like-counter", @$el)
    @id = @$el.data("id")
    @type = @$el.data("type")

    @bindings()

  bindings: (el)->
    @like_button.on "click", @likeHandler

  likeHandler: (event)=>
    event.preventDefault()

    url = @like_button.attr("href")

    $.ajax(
      url: url
      method: "POST"
      dataType: "json"
      success: =>
        @updateLikeCounter()
    )

  updateLikeCounter: =>
    element =  parseInt(@likes.text()) + 1
    @likes.text(element)

$ ->
  pages = $(".like-box")
  new Page(page) for page in pages
