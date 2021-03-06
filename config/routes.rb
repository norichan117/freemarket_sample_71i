Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
   }
  root "categorys#index"
  resources :users, only: [:show, :edit]
  resources :items  do
    resources :tradings, only:[:new, :create]
    resources :favorites, only: [:create, :destroy],defaults: {format: 'json'}
  end
  resources :categorys, only: [:index, :show]
  resources :user_cards, only:[:new, :create, :show, :destroy]
  resources :user_addresses, only:[:new, :create, :edit, :update]
  resources :deliver_addresses, only:[:new, :create, :edit, :update]
end


