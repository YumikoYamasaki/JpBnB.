class Post < ActiveRecord::Base
    validates :title, {presence: true}
    validates :content, {presence: true}
    validates :location, {presence: true}
    validates :user_id, {presence: true}

    mount_uploader :picture, PostUploader
    
    belongs_to :user
    
    def user
        return User.find_by(id: self.user_id)
    end
    

end
