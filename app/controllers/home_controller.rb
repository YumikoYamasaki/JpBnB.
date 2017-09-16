class HomeController < ApplicationController
  before_action :login_user
  
  def top
    @posts = Post.order(created_at: :desc).last(4)
  end
  
  def signup
    require "date"
    @t = Date.today
    @years = [*@t.year-100..@t.year-18].sort.reverse
    @months = [*1..12]
    @days = [*1..31]
    @user = User.new(
    lname: params[:lname],
    fname: params[:fname],
    email: params[:email],
    pwd: params[:pwd]
    )
  end
  
  def login_user
    if @current_user
      redirect_to("/find")
    end
  end
    
end
