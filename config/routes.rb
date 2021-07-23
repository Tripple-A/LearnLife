# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'books#home'
  resources :books
  resources :users do
    post '/assign_book', to: 'users#assign_book'
  end
  get '/borrowed_books', to: 'books#borrowed_books'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
