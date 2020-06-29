class PostsController < ApplicationController
    def index
        @posts = Post.all
    end    
    def new
    end    
    def create
        post = Post.new(content: params[:content])
        if post.save
            redirect_to("/posts/index")
        end    
        
    end
end
