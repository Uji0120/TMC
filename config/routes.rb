Rails.application.routes.draw do

  #namespace :user do
    #get 'users/show'
    #get 'users/edit'
    #get 'users/unsubscribe'
  #end
  #namespace :admin do
    #get 'users/index'
    #get 'users/show'
    #get 'users/edit'
  #end
  #namespace :admin do
    #get 'genres/new'
    #get 'genres/index'
    #get 'genres/edit'
  #end
  #namespace :admin do
    #get 'comments/edit'
  #end
  #namespace :admin do
    #get 'posts/new'
    #get 'posts/index'
    #get 'posts/show'
    #get 'posts/edit'
  #end
  #namespace :admin do
    #get 'homes/top'
  #end
  #namespace :user do
    #get 'chats/new'
    #get 'chats/index'
    #get 'chats/show'
  #end
  #namespace :user do
    #get 'comments/new'
    #get 'comments/edit'
  #end
  #namespace :user do
    #get 'bookmarks/index'
  #end
  #namespace :user do
    #get 'posts/new'
    #get 'posts/index'
    #get 'posts/show'
    #get 'posts/edit'
  #end
  #namespace :user do
    #get 'homes/top'
    #get 'homes/about'
  #end

  #devise_for :chats
  #devise_for :likes
  #devise_for :comments
  #devise_for :genres
  #devise_for :bookmarks
  #devise_for :posts

  devise_for :users,skip: [:passwords], controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
}

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

scope module: :user do
  root 'homes#top'
  get "home/about" => "homes#about", as: "about"
  post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'

  resources :posts do #only: [:new, :index, :show, :edit, :update, :destroy]
    resources :introductions, only: :create
    collection do
      get 'search'
    end
  end
  

  resources :likes, only: [:create, :destroy]

  resources :bookmarks, only: [:index, :create, :destroy]

  resources :comments, only: [:new, :edit, :create, :update, :destroy]

  resources :chats, only: [:new, :index, :show, :create]

  resources :users, only: [:index, :show, :edit, :update]
  get 'users/unsubscribe/:id' => 'users#subscribe', as: 'unsubscribe'
  get 'users/withdrawal/:id' => 'users#withdrawal', as: 'withdrawal'

end

namespace :admin do

root 'homes#top'
resources :posts, only:[:new, :index, :show, :edit, :create, :update, :destroy]

resources :comments, only: [:edit, :create, :destroy]

resources :genres, only: [:new, :index, :show, :create, :update, :destroy]

resources :users, only: [:index, :show, :edit, :update]

end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
