module Pages
  class Save
    include Interactor

    delegate :page, to: :context

    def call
      page.save || context.fail!
    end

    def rollback
      page.destroy
    end
  end
end
