Rails.application.routes.draw do
  resources :category_scores
  resources :categories
  resources :life_wheels
  resources :mood_records
  resources :habit_records
  resources :habits
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
