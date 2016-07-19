class SaveComment
  include Interactor

  delegate :comment, to: :context

  def call
    comment.save || context.fail!
  end
end
