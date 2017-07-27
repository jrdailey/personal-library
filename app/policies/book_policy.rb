class BookPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end

    def destroy?
      user.admin?
    end
  end
end
