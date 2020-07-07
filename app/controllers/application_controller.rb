class ApplicationController < ActionController::Base
    def now_user
        if session[:user_id]
            @now_user = User.find_by(id: session[:user_id])
        else
            redirect_to("/users/log_in")
        end    
    end
    def user_now
        if session[:user_id]
            @now_user = User.find_by(id: session[:user_id])
        end        
    end    
end
