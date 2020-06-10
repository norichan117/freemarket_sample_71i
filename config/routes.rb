Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
   }
  root "items#index"
  resources :users, only: [:index, :edit]
  resources :items, only: [:index, :show, :destroy]
end
