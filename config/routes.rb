Rails.application.routes.draw do
  resources :profiles

  resource :my_account

  resources :roles, except: [:new, :create, :destroy]
end
