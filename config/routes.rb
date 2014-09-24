Rails.application.routes.draw do
  resources :problem_types

  root 'panel#index'

  resources 'problems', only: [:create]
end
