class LifeWheel < ApplicationRecord
  belongs_to :user
  has_many :category_scores
  has_many :categories, through: :category_scores
end
