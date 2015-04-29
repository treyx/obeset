Rails.application.routes.draw do
  resources :schools
  resources :counties, only: [:index, :show]
end
