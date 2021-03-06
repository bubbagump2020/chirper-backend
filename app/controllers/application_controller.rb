class ApplicationController < ActionController::Base
    rescue_from Exception, :with => :render_error_response

    def render_error_response(error)
        render json: error
    end

    def current_user
        begin
            method, token = request.headers[:Authorization].split(' ')
            if method === 'Bearer'
                payload, header = JWT.decode(token, 'asdljasldkfjs')
                User.find(payload["id"])
            end
        rescue
            raise Exception.new('You must be logged in to make this request')
        end
    end
end