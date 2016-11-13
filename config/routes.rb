Rails.application.routes.draw do
  resource :profiles

  resource :my_account

  resources :roles, except: [:new, :create, :destroy]
end
