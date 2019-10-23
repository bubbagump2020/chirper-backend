class ReviewsController < ApplicationController
    # before_action :define_current_review
    
    def index
        render json: Review.all
    end

    def show
        render json: current_review
    end

    def create
        if(review_params[:user_id] == current_user.id)
            review = Review.create(review_params)
            render json: review
        end
    end

    def review_params
        params.permit(:user_id, :song_id, :title, :content)
    end

    def current_review
        @current_review
    end

end