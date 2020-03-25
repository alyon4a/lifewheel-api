class HabitRecordsController < ApplicationController
    
    def index
        user = User.find(params['user_id'])
        habit_records = user ? user.habit_records : [] 
        render json: habit_records, except: [:created_at, :updated_at]
    end

    def create
        user = User.find(params['user_id'])
        #TODO: clean up to private method
        date = params['date']
        habit_records = []
        params[:habits].each do |habit_param| 
            habit = user.habits.find{ |user_habit| habit_param[:name] == user_habit.name}
            habit_record = HabitRecord.create(habit: habit, yes_date: date)
            habit_records << habit_record
        end
        render json: habit_records, except: [:created_at, :updated_at]
    end

    def weekly_records
        user = User.find(params['user_id'])
        start_date = Date.parse(params['start_date'])
        #TODO test if maybe it's +6 instead of +7 given the => and =< below
        end_date = start_date + 7
        habits = user ? user.habits : []
        habits_w_records = []
        habits.map do |habit| 
            habit_w_records  = {name: habit.name,
                                habit_dates: []}
            habit.habit_records.each do |habit_record|
                habit_w_records[:habit_dates] << habit_record.yes_date if (habit_record.yes_date >= start_date && habit_record.yes_date <= end_date)
            end
            habits_w_records << habit_w_records
        end
        
        render json: habits_w_records, except: [:created_at, :updated_at]

    end
end
