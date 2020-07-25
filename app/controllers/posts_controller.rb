class PostsController < ApplicationController
    before_action :now_user    
    
    def index
        @posts = Post.all
    end    
    
    def new
    end    
    
    def create
        if session[:user_id]
            post = Post.new(content: params[:content],user_id: session[:user_id])
            if post == nil    
            else    
                if post.save
                    redirect_to("/posts/index")
                end    
            end
        else
            redirect_to("/users/log_in")    
        end    
    end
    
    def show
        @post = Post.find_by(id: params[:id])
    end    

    def editer
        @post = Post.find_by(id: params[:id])
    end    

    def edit
        @post = Post.find_by(id: params[:id])
        @post.content = params[:edit]
        if @now_user.id == @post.user_id
            @post.save
            redirect_to("/posts/index")
        else
            redirect_to("/posts/index")    
        end    
    end    
    
    def erase
        @post = Post.find_by(id: params[:id])
        if Like.find_by(post_id: @post.id) 
            @like = Like.find_by(post_id: @post.id) 
            @like.destroy
        end    
        if @now_user.id == @post.user_id
            @post.destroy
        end
        redirect_to("/posts/index")           
    end    

    def one
        
    end    
end
