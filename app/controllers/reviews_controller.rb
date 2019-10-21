class ReviewsController < ApplicationController
    def index
        render json: Review.all
    end

    def show

    end

    def create

    end

end