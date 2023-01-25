Rails.application.routes.draw do
  
  
  devise_for :users
  root to: 'homes#top'
  
  resources :books, only: [:create, :index, :show, :destroy, :edit, :update]
  resources :users, only: [:show, :edit, :update, :index]
  
  get '/homes/about' => "homes#about", as: 'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
