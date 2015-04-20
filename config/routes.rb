Library::Application.routes.draw do
  scope module: :web do
    root to: "books#index"

    resource :session, only: [:new, :create, :destroy]

    resources :books, only: [:show, :index]
    resources :users, only: [:new, :create]
    resources :teams, only: [:new, :create, :show]

    namespace :account do
      root to: "users#show"

      resources :books
      resource :user, only: [:show]
      resources :requests, only: [:index]
      resources :readings, only: [:index]
      resource :team, only: [:show, :edit, :update, :destroy] do
        scope module: :teams do
          resources :members, only: [:index, :new, :create]
        end
      end
    end
  end

  namespace :api do
    resources :requests, only: [:create, :update, :destroy]
    resources :readings, only: [:create, :update]
  end
end
