class PageDecorator < ApplicationDecorator
  delegate :title, :body, :theme
end
