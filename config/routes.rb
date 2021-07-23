Rails.application.routes.draw do
  root to: 'books#home'
  resources :books
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
