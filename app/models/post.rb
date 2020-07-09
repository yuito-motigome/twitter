class Post < ApplicationRecord
    validates :content, presence: true
    def user
        return User.find_by(id: self.user_id)
    end    
    def like
        return Like.find_by(post_id: self.post.id,user_id: session[user_id])
    end
end
