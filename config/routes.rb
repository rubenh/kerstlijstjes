Rails.application.routes.draw do
  resources :presents do
    resource :reservations
  end
  root to: 'visitors#index'
  devise_for :users
end
