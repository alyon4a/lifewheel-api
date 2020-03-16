Rails.application.routes.draw do
  resources :category_scores
  
  resources :life_wheels
  resources :mood_records
  resources :habit_records
  resources :habits
  resources :users, only: [:index, :show] do
    resources :categories, only: [:index]
    resources :life_wheels, only: [:index, :create]
    resources :category_scores, only: [:index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
