Rails.application.routes.draw do
  resources :schools, only: [:index, :show]
  resources :counties, only: [:index, :show]
end
