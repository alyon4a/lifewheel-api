Rails.application.routes.draw do
  resources :category_scores
  resources :mood_records
  resources :users, only: [:index, :show] do
    resources :categories, only: [:index]
    resources :life_wheels, only: [:index, :create]
    resources :category_scores, only: [:index]
    resources :habits, only: [:index]
    resources :habit_records, only: [:index, :create]
  end

  get 'users/:user_id/weekly_habit_records', to: 'habit_records#weekly_records'
  get 'users/:user_id/full_life_wheels', to: 'life_wheels#index_full'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
