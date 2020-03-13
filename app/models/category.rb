class Category < ApplicationRecord
  belongs_to :user
  has_many :category_scores
end
