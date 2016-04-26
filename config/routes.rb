Rails.application.routes.draw do
  root 'home#index'
  resources :courses
  resources :students
end
