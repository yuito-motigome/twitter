class User < ApplicationRecord
    validates :email,uniqueness: true
    validates :user_name, presence: true
    has_secure_password
end
