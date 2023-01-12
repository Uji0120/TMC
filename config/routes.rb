Rails.application.routes.draw do

  namespace :user do
    get 'users/show'
    get 'users/edit'
    get 'users/unsubscribe'
  end
  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
  end
  namespace :admin do
    get 'genres/new'
    get 'genres/index'
    get 'genres/edit'
  end
  namespace :admin do
    get 'comments/edit'
  end
  namespace :admin do
    get 'posts/new'
    get 'posts/index'
    get 'posts/show'
    get 'posts/edit'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :user do
    get 'chats/new'
    get 'chats/index'
    get 'chats/show'
  end
  namespace :user do
    get 'comments/new'
    get 'comments/edit'
  end
  namespace :user do
    get 'bookmarks/index'
  end
  namespace :user do
    get 'posts/new'
    get 'posts/index'
    get 'posts/show'
    get 'posts/edit'
  end
  namespace :user do
    get 'homes/top'
    get 'homes/about'
  end

  devise_for :chats
  devise_for :likes
  devise_for :comments
  devise_for :genres
  devise_for :bookmarks
  devise_for :posts

  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
