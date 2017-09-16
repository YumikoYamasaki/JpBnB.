class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def edit?
      user.admin? or not post.published?
    end
    def update?
      edit?
    end
    
    def resolve
      scope
    end
  end
end
