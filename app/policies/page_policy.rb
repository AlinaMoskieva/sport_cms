class PagePolicy < ApplicationPolicy

  def destroy?
    @user.role == "administrator" && @record.user_id == @user.id
  end

  def update?
    @user.role == "administrator" && @record.user_id == @user.id
  end

  def create?
     @user.role == "administrator"
  end
end
