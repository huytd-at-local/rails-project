class Follow < ApplicationRecord
    validates :follower_id, {presence: true}
    validates :follow_user_id, {presence: true}

    def user
        return User.find_by(id: self.follower_id)
    end

    def following
        return User.find_by(id: self.follow_user_id)
    end
end
