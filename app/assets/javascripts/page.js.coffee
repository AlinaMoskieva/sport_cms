class Page
  constructor: (el) ->
    @el = el
    @$el = $(el)
    @content = $(".content", @$el)
    @shorten_title = $(".shorten_title", @$el)
    @full_title = $(".full_title", @$el)

    @bindings()

  bindings: ->
    @shorten_title.on "mouseover", @show_full_title
    @full_title.on "mouseout", @hide_full_title

  show_full_title: (event) =>
    if @shorten_title.text() != @full_title.text()
      @shorten_title.hide()
      @full_title.show()
      @content.height(200)

  hide_full_title: (event) =>
    if @shorten_title.text() != @full_title.text()
      @full_title.hide()
      @shorten_title.show()
      @content.height(130)

$ ->
  pages = $(".card")
  new Page(page) for page in pages

