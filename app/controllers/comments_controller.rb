class CommentsController < ApplicationController
    before_action :authenticate_user!
    
    def new
        @post = Post.find(params[:post_id])
        @user = @post.user
        @comment = Comment.new
    end
    
    def create 
        @comment = Comment.create(params_comment)
        post_commented = @comment.post
        redirect_to post_path(post_commented)
    end
    
    def destroy
        
        comment = Comment.find(params[:id])
        post = comment.post
        comment.destroy
        redirect_to post_path(post)
    end
    
    # プライベート関数
    private
    def params_comment
        params.require(:comment).permit(:text,:user_id,:post_id)
    end
end
