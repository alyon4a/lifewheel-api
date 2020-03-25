class CategoryScoresController < ApplicationController

    def index
        user = User.find(params['user_id'])
        category_scores = user ? user.category_scores : []
        render json: category_scores, except: [:created_at, :updated_at]
    end

end
