class PageDecorator < ApplicationDecorator
  delegate :title, :body, :created_at, :category_id, :visitors, :category, :user
  delegate :full_name, to: :user, prefix: true
  delegate :category, :count, to: :category, prefix: true
  delegate :count, to: :comments, prefix: true

  decorates_association :comments
end
