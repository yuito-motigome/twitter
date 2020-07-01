class PostsController < ApplicationController
    def index
        @posts = Post.all
    end    
    
    def new
    end    
    
    def create
        post = Post.new(content: params[:content])
        if post != nil    
            if post.save
                redirect_to("/posts/index")
            end    
        end
    end
    
    def show
        @post = Post.find_by(id: params[:id])
    end    
end
