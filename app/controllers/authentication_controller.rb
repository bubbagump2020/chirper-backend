class AuthenticationController < ApplicationController
    def login
        user, * = User.where({ email: params[:email] })
        if(user && user.authenticate(params[:password]))
            token = JWT.encode( { id: user.id }, 'asdljasldkfjs', 'HS256')
            render json: { success: true, id: user.id, token: token }
        else
            render json: { success: false, id: nil }
    end
end