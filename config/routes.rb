Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :users
  resources :teams
  resources :wallets do
    collection do
      post :topup
      post :withdrawal
    end
  end
end
