class Follow < ApplicationRecord
    validates :follower_id, {presence: true}
    validates :follow_user_id, {presence: true}
end
