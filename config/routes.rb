Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
   }
  root "categorys#index"
  resources :users, only: [:show, :edit]
  resources :items, only: [:index, :show, :new, :edit]
  resources :categorys, only: [:index, :show] do
    resources :items, only: [:index, :show, :new, :edit]
  end
  resources :user_addresses, only:[:new, :create, :edit]
  resources :deliver_addresses, only:[:new, :create, :edit]
  resources :tradings, onry:[:new, :create]
end
