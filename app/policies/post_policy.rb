class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def edit?
      user.admin? or not post.published?
    end
    def update?
      edit?
    end
    def destroy?
      if user.admin?
        [:title, :location, :content, :picture]
      end
    end
    
    def resolve
      scope
    end
  end
end
