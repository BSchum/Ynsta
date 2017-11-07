Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'

  resources :posts
  get '/categories/:category_id', to: 'posts#index'
  get '/tags/:tag_id', to: 'posts#index'
end
