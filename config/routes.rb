Rails.application.routes.draw do
  root 'panel#index'

  resources 'problems', only: [:create]
end
