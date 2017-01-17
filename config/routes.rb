Rails.application.routes.draw do
  resources :organizations, only: [:index, :create, :destroy], param: :slug do
    resources :events, only: [:index, :create]
  end

  resources :events, only: [:index]
end
