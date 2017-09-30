class UserController < ApplicationController
    def create
        @user = User.new(
            lname: params[:lname],
            fname: params[:fname],
            email: params[:email],
            password: params[:password],
            birth: [params[:year],params[:month],params[:day]],
            user_img: "user_img_default.jpg"
            )
        if @user.save
            session[:user_id] = @user.id
            flash[:notice] = "ユーザー登録が完了しました"
            redirect_to("/find")
        else
            render("signup")
        end
    end
    
    def show
        @user = User.find_by(id: params[:id])
        @lists = Post.page(params[:page])
    end
    
    def like
        @user = User.find_by(id: params[:id])
        @likes = Like.where(user_id: @user.id)
        @lists = Post.page(params[:page])
    end
    
    def edit
        @user = User.find_by(id: params[:id])
        authorize @user
    end
    
    def update
        @user = User.find_by(id: params[:id])
        @user.lname = params[:lname]
        @user.fname = params[:fname]
        @user.email = params[:email]
        if params[:user_img]
            @user.user_img = "#{@user.id}.jpg"
            user_img = params[:user_img]
            File.binwrite("public/user_img/#{@user.user_img}", user_img.read)
        end
        if @user.save
          flash[:notice] = "ユーザー情報を編集しました"
          redirect_to("/user/#{@user.id}")
        else
          render("user/edit")
        end
    end
    
    def login
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            flash[:notice] = "ログインしました"
            redirect_to("/find")
        else
            @error_message = "メールアドレスまたはパスワードが間違っています。"
            @email = params[:email]
            redirect_to("/out")
        end
    end
    
    def logout
        session[:user_id] = nil
        flash[:notice] = "ログアウトしました"
        redirect_to("")
    end
end
