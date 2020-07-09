class LikesController < ApplicationController
    before_action :user_now
    def new
      if @now_user  
        like = Like.new(user_id: @now_user.id,post_id: params[:id])
        like.save
        redirect_to("/posts/index")
      end  
    end

    def destroy
        @like = Like.find_by(user_id: @now_user.id,post_id: params[:id])
        @like.destroy
        redirect_to("/posts/index")
    end    
end
