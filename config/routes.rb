Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
   }
  root "categorys#index"
  resources :users, only: [:show, :edit] do
    resources :user_addresses, only:[:new, :create, :edit]
    resources :deliver_addresses, only:[:new, :create, :edit]
  end
  resources :items, only: [:index, :show, :new, :edit]
  resources :categorys, only: [:index, :show]
  resources :tradings, onry:[:new, :create]
end
