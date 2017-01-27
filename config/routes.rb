Rails.application.routes.draw do
  resources :organizations, only: [:index, :create, :destroy], param: :slug do
    get :foreign_hosts, on: :collection

    resources :events, only: [:index, :create]
  end

  resources :events, only: [:index]
end
