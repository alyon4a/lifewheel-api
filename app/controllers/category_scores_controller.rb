class CategoryScoresController < ApplicationController

    def index
        categoryScores = CategoryScore.all
        render json: categoryScores, except: [:created_at, :updated_at]
    end

end
