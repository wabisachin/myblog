class TopController < ApplicationController
     def index
          @posts = Post.order(created_at: "DESC").page(params[:page]).per(5)
          @post = Post.new
     end
end
