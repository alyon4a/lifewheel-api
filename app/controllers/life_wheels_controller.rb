class LifeWheelsController < ApplicationController

    def index 
        user = User.find(params['user_id'])
        life_wheels = user ? user.life_wheels : [] 
        render json: life_wheels, except: [:created_at, :updated_at]
    end

    def index_full
        user = User.find(params['user_id'])
        life_wheels = user ? user.life_wheels : [] 

        full_life_wheels = []
        life_wheels.each do |life_wheel| 
            full_life_wheel = {name: life_wheel.name, date: life_wheel.date, id: life_wheel.id}
            full_cat_scores = []
            life_wheel.category_scores.each do |category_score|
                full_cat_score = {name: category_score.category.name, 
                                  score: category_score.score}
                full_cat_scores << full_cat_score
            end
            full_life_wheel[:category_scores] = full_cat_scores
            
            full_life_wheels << full_life_wheel
        end
        render json: full_life_wheels, except: [:created_at, :updated_at]
    end

    def create
        user = User.find(params['user_id'])
        time = Time.now
        month = time.strftime("%B")
        #TODO: change name after the fiels is added
        #TODO: clean up to private method
        date = time.strftime("%Y-%m-%d")
        life_wheel = LifeWheel.create(name: month, date: date, user: user)
        params[:category_scores].each do |category_score| 
            category = user.categories.find{ |category| category.name == category_score[:name]}
            CategoryScore.create(category: category, life_wheel: life_wheel, score: category_score[:score])
        end
        render json: life_wheel, except: [:created_at, :updated_at]
    end
end
