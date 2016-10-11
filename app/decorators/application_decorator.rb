class ApplicationDecorator < Draper::Decorator
  include ActionView::Helpers::DateHelper
  include Draper::LazyHelpers

  delegate :id, :to_model

  def self.collection_decorator_class
    PaginatingDecorator
  end
end
