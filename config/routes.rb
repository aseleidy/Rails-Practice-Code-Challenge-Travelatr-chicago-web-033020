Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bloggers
  resources :destinations
  resources :posts
  get '/posts/:id/like', to: 'posts#like', as: 'like_post'
end
