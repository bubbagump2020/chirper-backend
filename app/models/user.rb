class User < ApplicationRecord
    validates :username, uniqueness: true
    validates :email, uniqueness: true
    validates :password, length: { minimum: 6 }
    has_secure_password
    has_many :reviews
    # has_many :songs, through: :reviews
end
