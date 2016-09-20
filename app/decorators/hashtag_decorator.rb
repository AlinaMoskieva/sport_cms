class HashtagDecorator < ApplicationDecorator
  delegate :hashtag, :pages_count

  def pages?
    object.pages.count > 0
  end
end
