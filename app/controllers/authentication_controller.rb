class AuthenticationController < ApplicationController

    def login
        user = User.find_by({ email: params[:email] })
        # byebug
        if(user && user.authenticate(params[:password]))
            token = JWT.encode( { id: user.id }, 'asdljasldkfjs', 'HS256')
            puts token
            render json: { success: true, id: user.id, token: token }
        else
            render json: { success: false, id: nil }
        end
    end

end