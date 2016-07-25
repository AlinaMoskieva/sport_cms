class HashtagDecorator < ApplicationDecorator
  delegate :hashtag

  def pages?
    object.pages.count > 0
  end

  def pages_count
    object.pages.count
  end
end
