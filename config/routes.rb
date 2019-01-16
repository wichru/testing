Rails.application.routes.draw do
  devise_for :users

  root "home#welcome"
  resources :genres, only: :index do
    member do
      get "movies"
    end
  end
  resources :movies, only: [:index, :show] do
    resources :likes, only: %i[create destroy]
    member do
      get :send_info
    end
    collection do
      get :export
    end
  end
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :movies
    end
    namespace :v2, defaults: { format: :json } do
      resources :movies
    end
  end
end
