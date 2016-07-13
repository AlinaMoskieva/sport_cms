class PageDecorator < ApplicationDecorator
  delegate :title, :body, :created_at, :category_id, :visitors, :category, :user,
    :comments_count
  delegate :full_name, :id, to: :user, prefix: true
  delegate :category, :count, to: :category, prefix: true

  def data_format
    created_at.strftime("%m/%d/%Y at %I:%M%p ")
  end

  def preview_body
    if object.body.length > 330
      object.body.html_safe.slice(0..330).concat(" ...")
    else
      object.body.html_safe
    end
  end

  def shorten_title
    if object.title.length > 79
      object.title.slice(0..79).concat(" ...")
    else
      object.title
    end
  end
end
