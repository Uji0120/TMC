Rails.application.routes.draw do

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
  post '/home/guest_sign_in', to: 'homes#guest_sign_in'

  resources :posts do #only: [:new, :index, :show, :edit, :update, :destroy]
    resources :introductions, only: [:create]
    collection do
      get 'search'
    end
    resource :bookmarks, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  
  #resources :bookmarks, only: [:index, :create, :destroy]
  #resources :comments, only: [:new, :edit, :create, :update, :destroy]
  #resources :chats, only: [:new, :index, :show, :create]
  get 'chat/:id' => 'chats#show', as: 'chat'
  resources :chats, only: [:create]

  resources :users, only: [:index, :show, :edit, :update] do
    get :bookmarks, on: :collection 
  end
  get 'users/unsubscribe/:id' => 'users#subscribe', as: 'unsubscribe'
  get 'users/withdrawal/:id' => 'users#withdrawal', as: 'withdrawal'

end

namespace :admin do

root 'homes#top'

resources :posts, only:[:new, :index, :show, :edit, :create, :update, :destroy] do
  resources :comments, only: [:edit, :create, :destroy]
end
resources :genres, only: [:edit, :create, :index, :update, :destroy]

resources :users, only: [:index, :show, :edit, :update]

end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
