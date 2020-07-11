class UsersController < ApplicationController
    before_action :user_now

    def create
    end
    def sign_up
        user=User.new(
            email: params[:mail],
            user_name: params[:user_name],
            password: params[:password],
            image_name: "default_user.jpg"
        )
        user.save
        redirect_to("/posts/index")
    end

    def log_in
    end    

    def sign_in
        if user=User.find_by(email: params[:mail])
            if user.authenticate(params[:password]) 
                session[:user_id]=user.id
                session[:user_name]=user.user_name
            end    
            redirect_to("/posts/index")
        end
        
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

    def update
        @user = User.find_by(id: params[:id])
        if @user.id != session[:user_id]
            redirect_to("/users/#{@user.id}/show")
        end                                
    end    

    def edit
        user = User.find_by(id: params[:id])
        user.email = params[:mail]
        user.user_name = params[:user_name]
        user.password = params[:password]
        if params[:image]
            image = params[:image]
            user.image_name = "#{user.id}.jpg"
            File.binwrite("app/assets/images/#{user.image_name}", image.read)
        end
        user.save
        redirect_to("/users/#{user.id}/show")                                   
    end 
end
