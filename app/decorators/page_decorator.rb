class PageDecorator < ApplicationDecorator
  delegate :title, :body, :position, :theme
end
