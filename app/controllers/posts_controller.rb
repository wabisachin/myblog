class PostsController < ApplicationController
    
    before_action :authenticate_post_user, only: [:update,:edit,:destroy]
    before_action :authenticate_user!
    #新規投稿画面の作成
    def new
        @post = Post.new
    end
    
    def create
        Post.create(post_params)
        redirect_to :root
    end
    
    def edit
        @post = Post.find(params[:id])
    end
    
    def update
        post = Post.find(params[:id])
        if post.update(post_params)
            redirect_to :root
        else 
            flash[:notice] = "最低１文字以上入力して下さい"
            redirect_to action: "edit"
        end
    end
    
    def destroy
        post = Post.find(params[:id])
        post.destroy
        redirect_to :root
    end
    
    def authenticate_post_user
        post = Post.find(params[:id])
        
        unless post.user_id == current_user.id
            flash[:notice] = "他ユーザーの投稿は編集できません"
            redirect_to root_path
        end
    end
    
    #ここからprivate
    private
    def post_params
        params.require(:post).permit(:user_id, :text)
    end
end
