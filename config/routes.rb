Rails.application.routes.draw do
  resources :schools, only: [:index, :show, :new]
  resources :counties, only: [:index, :show]
end
