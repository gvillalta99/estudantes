Rails.application.routes.draw do
  root 'home#index'
  resources :classrooms
  resources :courses
  resources :students
end
