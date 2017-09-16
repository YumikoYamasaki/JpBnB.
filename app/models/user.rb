class User < ActiveRecord::Base
    has_secure_password
    
    validates :password, {presence: true}
    
    has_many :posts
    
    def posts
        return Post.where(user_id: self.id)
    end
    
end
