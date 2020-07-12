Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
   }
  root "categorys#index"
  resources :users, only: [:show, :edit]
  resources :items  do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    resources :tradings, only:[:new, :create]
    resources :item_deliver_addresses, only:[:new, :create, :edit, :update]
  end
  resources :categorys, only: [:index, :show]
  resources :user_cards, only:[:new, :create, :show, :destroy]
  resources :user_addresses, only:[:new, :create, :edit, :update]
  resources :deliver_addresses, only:[:new, :create, :edit, :update]
end


