Rails.application.routes.draw do
  devise_for :users
  resources :posts, only: %i[index show] #используются только пути для index и show
  namespace :current_user do
    resources :posts
  end
  root "posts#index"
end
