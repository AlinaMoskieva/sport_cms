module Comments
  class Save
    include Interactor

    delegate :comment, to: :context

    def call
      comment.save || context.fail!
    end

    def rollback
      comment.destroy
    end
  end
end
