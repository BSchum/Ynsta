Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'
  resources :posts
  post '/like', to: 'like#like', as: 'like_post'
  post '/unlike', to: 'like#unlike', as: 'unlike_post'
  get '/categories/:category_id', to: 'posts#index', as: 'categories_index'
  get '/tags/:tag_id', to: 'posts#index'
  get '/user/:slug', to: 'posts#index'
  get '/search', to: 'posts#index'  
  get '/users', to: 'posts#index'

end
