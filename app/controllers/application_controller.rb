class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  include Pundit
  
  before_action :set_current_user
  
  rescue_from NotAuthorizedError, with: :render_401
  
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end
  
  def pundit_user
    @current_user = User.find_by(id: session[:user_id])
  end
  
  
  def render_401(exception = nil)
    if exception
      logger.info "Rendering 401 with exception: #{exception.message}"
    end
    render file: "#{Rails.root}/public/401.html", status: 401, content_type: 'text/html'
  end
  
end
