Rails.application.routes.draw do
  devise_for :users
  root to: "home#top"
  namespace :admin do
    root to: "home#top"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
