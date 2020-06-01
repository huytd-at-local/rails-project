class User < ApplicationRecord
    validates :email, {presence: true, uniqueness: true} 
    validates :name, {presence: true, uniqueness: true}
    validates :password, {presence: true}
    validates :image_name, {presence: true} 
end
