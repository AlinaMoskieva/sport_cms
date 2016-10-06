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
    $.ajax(
      url: @generateUrl()
      method: "POST"
      dataType: "json"
      success: =>
        @like_button.hide()
        @updateLikeCounter()
    )

  updateLikeCounter: =>
    element =  parseInt(@likes.text()) + 1
    @likes.text(element)

  generateUrl: =>
    "/:type/:id/likes".replace(":id", @id).replace(":type", @type.toLowerCase() + "s")

$ ->
  pages = $(".like-box")
  new Page(page) for page in pages
