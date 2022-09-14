Rails.application.routes.draw do

devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
  sessions:      'admins/sessions'
}
  devise_for :publics, controllers: {
  sessions:      'publics/sessions',
  passwords:     'publics/passwords',
  registrations: 'publics/registrations'
}

  root to: "publics/homes#top"
  get "about" => "publics/homes#about", as: "about"
  namespace :publics do
    delete "cart_items", to: 'publics/cart_items#destroy_all'
    resources :customers, only: [:show, :edit, :update, :unsubscribe, :withdraw]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :create, :update, :destroy]
    resources :orders, only: [:new, :index, :show, :confirm, :complete, :create]
  end
  namespace :admins do
    root to: "homes#top"
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
