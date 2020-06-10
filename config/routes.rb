Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
   }
  root "categorys#index"
  resources :users, only: [:index, :edit]
  resources :items, only: [:index, :show]
  resources :categorys, only: [:index, :show]
end
