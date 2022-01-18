Rails.application.routes.draw do
  resources :comments do
    resources :comments, only: :index
  end
  resources :posts do
    resources :comments, only: :index
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
