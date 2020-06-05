class User < ApplicationRecord
    validates :email, {presence: true, uniqueness: true} 
    validates :name, {presence: true, uniqueness: true}
    validates :password, {presence: true}
    validates :image_name, {presence: true} 

    def posts
        return Post.all.where(user_id: self.id)
    end
end
