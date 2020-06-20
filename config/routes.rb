Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
   }
  root "categorys#index"
  resources :users, only: [:show, :edit]
  resources :items, only: [:index, :show, :new]
  resources :categorys, only: [:index, :show]
  resources :user_addresses, only:[:new, :create, :edit]
  resources :deliver_addresses, only:[:new, :create, :edit]
  resources :user_cards, only:[:index, :new, :create]
end
