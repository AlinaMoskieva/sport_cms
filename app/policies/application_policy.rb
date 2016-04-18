class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    if record.nil?
      @record = record
    else
      @record = record.to_model
    end
  end
end
