Rails.application.routes.draw do

  devise_for :users
  resources :users
  resources :books do
   resources :book_comments, only: [:create,:destroy]
   resource :favorites, only: [:create, :destroy]
  end

  root to: "homes#top"
  get 'home/about' => 'homes#about', as:'about'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
