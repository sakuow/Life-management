Rails.application.routes.draw do
  devise_for :users
  get 'sessions/new'
  get 'sessions/create'
  resources :schedules
  resources :spends
  resources :incomes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
