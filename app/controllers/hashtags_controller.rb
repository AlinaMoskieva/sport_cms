class HashtagsController < ApplicationController
  expose(:hashtag, attributes: :hashtag_params)
  expose(:hashtags) { Hashtag.all }

  def add_hashtags
    hashes = page.body.scan(/#\w+/)
    hashes.uniq!

    hashes.each do |hash|
      hash = hash.slice(1..hash.length)
      hashtag = Hashtag.where( hashtag: hash ).first

      if hashtag.nil?
        h = Hashtag.new
        h.hashtag = hash
        h.pages = Array.new
        h.pages << page.id
        h.save
      else
        unless hashtag.pages.include?(page.id)
          hashtag.pages << page.id
          hashtag.save
        end
      end
    end
  end

  private
  def hashtag_params
    params.require(:hashtag).permit(:hashtag, :pages)
  end
end
