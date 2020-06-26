Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
   }
  root "categorys#index"
  resources :users, only: [:show, :edit]
  resources :items  do
    resources :tradings, only:[:new, :create]
    member do
      get 'editaddress'
      get 'editcard'
    end
  end
  resources :categorys, only: [:index, :show]
  resources :user_addresses, only:[:new, :create, :edit]
  resources :deliver_addresses, only:[:new, :create, :edit]
  resources :user_cards, only:[:index, :new, :create]
  

end
