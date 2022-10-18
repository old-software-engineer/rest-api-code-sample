# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :books
      get 'author_index', to: 'books#author_index'
      get 'author_show/:id', to: 'books#author_show'
      post 'author_create', to: 'books#author_create'
      put 'author_update/:id', to: 'books#author_update'
      delete 'author_destroy/:id', to: 'books#author_destroy'
      post 'authenticate', to: 'authentication#create'
    end
  end
end
