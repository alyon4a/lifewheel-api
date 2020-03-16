class LifeWheelsController < ApplicationController

    def index 
        user = User.find(params['user_id'])
        life_wheels = user ? user.life_wheels : [] 
        render json: life_wheels, except: [:created_at, :updated_at]
    end

    def create
        user = User.find(params['user_id'])
        time = Time.now
        month = time.strftime("%B")
        #TBD: change name after the fiels is added
        date = time.strftime("%Y-%m-%d")
        life_wheel = LifeWheel.create(name: month, date: date, user: user)
        params[:category_scores].each do |category_score| 
            category = user.categories.find{ |category| category.name == category_score[:name]}
            CategoryScore.create(category: category, life_wheel: life_wheel, score: category_score[:score])
        end
        render json: life_wheel, except: [:created_at, :updated_at]
    end
end
