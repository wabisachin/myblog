class UsersController < ApplicationController
    before_action :prohibit_other_user, only: [:edit,:update]
    before_action :authenticate_user!
    
    def show
        @user = User.find(params[:id])
        @posts = Post.where(user_id: @user.id).order(updated_at: "DESC")
        @liked_posts = @user.liked_post
    end
    
    def edit
        @user = User.find(params[:id])
    end
    
    def update
        user = User.find(params[:id])
        user.update(params_user)
        redirect_to action: "show"
    end
    
    def prohibit_other_user
        user = User.find(params[:id])
        unless current_user.id == user.id 
            flash[:notice] = "そのページにはアクセスできません"
            redirect_to root_path
        end
    end
    
    private
    def params_user
        params.require(:user).permit(:nickname,:age,:hobby,:introduction,:image)
    end
end
