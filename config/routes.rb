Rails.application.routes.draw do


  devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
  sessions:      'admins/sessions'
}
  devise_for :customers,skip: [:passwords], controllers: {
  sessions:      'publics/sessions',
  registrations: 'publics/registrations'
}

  root to: "publics/homes#top"
  get "about" => "publics/homes#about", as: "about"
  get 'search' => 'posts#search'
  namespace :publics do
    delete "cart_items", to: 'publics/cart_items#destroy_all'
    resources :customers, only: [:show, :edit, :update] do
      collection do
        get "unsubscribe"
        patch "withdraw"
      end
    end
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :create, :update, :destroy] do
      collection do
        delete "all_destroy"
      end
    end
    resources :orders, only: [:new, :index, :show, :create] do
      collection do
        post "confirm"
        get "complete"
      end
    end
  end
  namespace :admins do
    root to: "homes#top"
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
