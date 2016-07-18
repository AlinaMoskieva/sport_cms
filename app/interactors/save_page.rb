class SavePage
  include Interactor

  delegate :page, to: :context

  def call
    page.save || context.fail!
  end
end
