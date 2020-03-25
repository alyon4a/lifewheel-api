class HabitsController < ApplicationController

    def index
        user = User.find(params['user_id'])
        habits = user ? user.habits : [] 
        render json: habits, except: [:created_at, :updated_at]
    end
end
