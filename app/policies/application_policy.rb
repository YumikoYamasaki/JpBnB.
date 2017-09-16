class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    true
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    true
  end

  def new?
    create?
  end
  
  def edit?
    if @current_user == nil
      false
    elsif record.user_id == user.id
      true
    end
    #if record.user_id == user.id
      #"edit"
    #else
      #redirect_to("/out")
      #flash[:notice] = "ログインが必要です"
    #end
    #user.admin? or can? "edit"
  end
  
  def update?
    edit?
  end

  def destroy?
    record.user_id == user.id
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
