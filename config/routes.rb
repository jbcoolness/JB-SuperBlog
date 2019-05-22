Rails.application.routes.draw do
  
  root "posts#index"
  
  resources :posts do
    resources :comments, only: [:create]
  end

  devise_for :users
end
