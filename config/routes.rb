Rails.application.routes.draw do
  devise_for :users
  resources :posts, only: %i[index show] do #используются только пути для index и show
    resources :comments, only: :create

  end
  namespace :current_user do
    resources :posts

  end
  root "posts#index"
end
