class LikesController < ApplicationController
    before_action :set_variables
    
    def create
        Like.create(user_id: current_user.id, post_id: params[:post_id])
        
    end
    
    def destroy
        like = Like.find_by(user_id: params[:id], post_id: params[:post_id])
        if like 
            like.destroy
        end
    end
    
    private
    
    def set_variables
        @post = Post.find(params[:post_id])
        @id_name = "#like-link-#{@post.id}"
    end

    
    
end
