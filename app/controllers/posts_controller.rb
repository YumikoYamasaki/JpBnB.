class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authorize_post, only: [:new, :create]
  #after_action :verify_authorized

  
  def find
    @posts = Post.all.order(created_at: :desc)
    @lists = Post.page(params[:page])
  end
  
  def search
    @location = Post.where(location: params[:location])
    if @location.present?
      render action: 'location'
    else
      redirect_to action: 'find', alert: '検索結果0なので全表示'
    end
  end
  
  def location
    @location = Post.where(location: params[:location])
  end
  
  def show
    @post = Post.find_by(id: params[:id])
    @user = User.find_by(id: @post.user_id)

  end
  
  def contribute
    @post = Post.new
  end
  
  def create
    @post = Post.new(
        user_id: @current_user.id,
        title: params[:title],
        location: params[:location],
        picture: params[:picture],
        content: params[:content]
      )

    unless params[:picture].nil? then  
      @post.picture = params[:picture]  
    end  
    
    if @post.save
      flash[:notice] = "新しいゲストハウスを登録しました"
      redirect_to("/find/#{@post.id}")
    else
      render("create")
    end
  end
  
  def edit
    @post = Post.find_by(id: params[:id])
    authorize @post
  end
  
  def update
    @post = Post.find_by(id: params[:id])
    @post.title = params[:title]
    @post.location = params[:location]
    @post.picture = params[:picture]
    @post.content = params[:content]

    if @post.save
      flash[:notice] = "情報を更新しました"
      redirect_to("/find/#{@post.id}")
    else
      render("find/#{@post.id}/edit")
    end
  end
  
  def destroy
      @post = Post.find_by(id: params[:id])
      authorize @post
      if @post.destroy
        redirect_to("/find")
      end
=begin
      if @post.destroy(post_params)
        redirect_to("/find")
      else
        redirect_to("/find/#{@post.id}")
      end
=end
      #Post::Delete.call(@post, current_user)
      # @post.destroy
  end

  
  private
    def set_post
        @post = Post.find(params[:id])
        # authorize @post
    end
    def authorize_post
        authorize Post
    end
    def post_params
        #params.require(:post).permit(*policy(@post || Post).permitted_attributes)
        params.require(:post).permit(:title, :locaction, :content, :picture)
        #params[:post].permit(:title, :locaction, :content, :picture)
    end

end
