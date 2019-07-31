class PostsController < ApplicationController
    
    before_action :authenticate_post_user, only: [:update,:edit,:destroy]
    before_action :authenticate_user!, except: [:show]
    #新規投稿画面の作成
    
    def show 
        @post = Post.find(params[:id])
        @user = @post.user
        @comments = @post.comments.order(created_at: "DESC")
    end
    
    def new
        @post = Post.new
    end
    
    def create
        post = Post.create(post_params)
        @posts = Post.order(created_at: "DESC").page(params[:page]).per(5)
        # 投稿に成功した場合、失敗した場合の分岐
        if post.text.present?
            # redirect_to :root
        else
            # flash[:danger] = "投稿するには最低１文字以上必要です"
            # redirect_to action: "new"
        end
    end
    
    def edit
        @post = Post.find(params[:id])
    end
    
    def update
        post = Post.find(params[:id])
        if post.update(post_params)
            redirect_to :root
        else 
            flash[:danger] = "最低１文字以上入力して下さい"
            redirect_to action: "edit"
        end
    end
    
    def destroy
        post = Post.find(params[:id])
        post.destroy
        redirect_to :root
    end
    
    
    
    #ここからprivate
    private
    def post_params
        params.require(:post).permit(:user_id, :text)
    end
    
    def authenticate_post_user
        post = Post.find(params[:id])
        
        unless post.user_id == current_user.id
            flash[:alert] = "他ユーザーの投稿は編集できません"
            redirect_to root_path
        end
    end
end
