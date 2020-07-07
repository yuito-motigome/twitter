class UsersController < ApplicationController
    before_action :user_now

    def create
    end
    def sign_up
        user=User.new(email: params[:mail],user_name: params[:user_name],password: params[:password],image_name:"default_user.jpg")
        user.save
        redirect_to("/posts/index")
    end

    def log_in
    end    
    
    def sign_in
        if user=User.find_by(email: params[:mail],password: params[:password])
            session[:user_id]=user.id
            session[:user_name]=user.user_name
        end
        redirect_to("/posts/index")
    end    

    def sign_out
        session[:user_id] = nil
        session[:user_name] = nil
        redirect_to("/")
    end
    
    def show
        if session[:user_id]
        else
            redirect_to("/users/log_in")
        end
        @posts = Post.where(user_id: params[:id])
        @user = User.find_by(id: params[:id])
    end    
end
