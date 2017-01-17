Rails.application.routes.draw do
  resources :organizations, only: [:index, :create, :destroy]
end
