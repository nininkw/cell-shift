Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  namespace :admin do
    root 'top#index'
    resources :stores
  end

  namespace :user do
    root 'top#index'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
