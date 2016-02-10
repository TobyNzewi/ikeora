Rails.application.routes.draw do

  resources :profiles
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  authenticated :user do
    root 'profiles#index', as: :authenticated_root
  end

  root 'home#index'
end
