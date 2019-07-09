class TopController < ApplicationController
     def index
          @posts = Post.page(params[:page]).per(5)
     end
end
