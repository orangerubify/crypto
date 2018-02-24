Rails.application.routes.draw do
  resources :stock_exchanges
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    resources :users, only: [] do
      collection do
        post :register
        post :login
      end
    end

    resources :home, only: [] do
      collection do
        get :bitfinex_data
      end
    end

    resources :stock_exchanges, only: [] do
      collection do
        get :all
        get :details
        get :pair
      end
    end
  end
end
