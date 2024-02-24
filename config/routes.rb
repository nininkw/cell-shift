Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  #メモ：userはシフト投稿とシフト確認のみ
  root to: 'top#top'
  resources :users, only: [:show, :edit, :update] do
    get "confirm_shift_posts", on: :member
  end
  resources :shift_posts, except: [:index] 
  
  namespace :admin do
    root to: 'top#top'
    resources :users
    resources :stores
    resources :shift_posts, only: [:index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
