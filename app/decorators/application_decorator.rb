class ApplicationDecorator < Draper::Decorator
  delegate :id, :to_model

  def self.collection_decorator_class
    PaginatingDecorator
  end

  protected

  def like?(user)
    Like.exists?(user_id: user.id, likeable_type: object.class.name, likeable_id: object.id)
  end
end
