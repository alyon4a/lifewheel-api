class CategoryScore < ApplicationRecord
  belongs_to :category
  belongs_to :life_wheel
end
