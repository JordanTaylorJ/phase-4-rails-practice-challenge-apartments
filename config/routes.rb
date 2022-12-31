Rails.application.routes.draw do
  resources :apartments, only: [:index, :update, :create, :destroy]
  resources :tenants, only: [:index, :update, :create, :destroy]
  resource :leases, only: [:create, :destroy]
  
  get 'tenants/four', to: 'tenants#four_char'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html



end
