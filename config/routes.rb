Rails.application.routes.draw do
  root to: 'houses#index'

  resources :characters, except: [:new, :create]
  resources :houses do
    resources :characters, only: [:new, :create]
  end
end
