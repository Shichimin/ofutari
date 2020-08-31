Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  resources :posts do
    resources :comments, only: :create
  end
  resources :users, only: [:show, :edit, :update]
  resources :rooms, only: [:new, :create, :show] do
    collection do
      post 'chat_message'
    end
  end
end
