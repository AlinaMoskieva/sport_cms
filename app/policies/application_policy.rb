class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  protected

  def admin?
    user.present? && user.administrator?
  end
end
