class HabitsController < ApplicationController

    def index
        habits = Habit.all
        render json: habits, except: [:created_at, :updated_at]
    end
end
