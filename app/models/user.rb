class User < ApplicationRecord
    has_many :habits
    has_many :habit_records, through: :habits
    has_many :categories
    has_many :life_wheels
    has_many :category_scores, through: :life_wheels
    has_many :mood_records
end
