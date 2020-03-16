class CategoriesController < ApplicationController
    def index 
        user = User.find(params['user_id'])
        categories = user ? user.categories : [] 
        render json: categories, except: [:created_at, :updated_at]
    end
end
