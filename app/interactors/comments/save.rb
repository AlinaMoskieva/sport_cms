module Comments
  class Save
    include Interactor

    delegate :comment, :action, to: :context

    def call
      comment.save || context.fail!
    end
  end
end
