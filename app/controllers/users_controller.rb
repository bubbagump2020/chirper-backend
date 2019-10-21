class UsersController < ApplicationController
    def create
        user = User.create(user_params)
        render json: user
    end

    def user_params
        params.permit(:username, :email, :password)
    end
end