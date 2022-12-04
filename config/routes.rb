Rails.application.routes.draw do
  resources :apartments, only: [:update, :create, :destroy]
  resources :tenants, only: [:update, :create, :destroy]
  resource :leases, only: [:create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
