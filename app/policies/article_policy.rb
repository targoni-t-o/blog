class ArticlePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def update?
    user.admin? || user.moderator?
  end

  def edit?
    update?
  end

  def destroy?
    user.admin?
  end
end
