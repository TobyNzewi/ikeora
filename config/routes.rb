Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get "/profile/show" => "profiles#show"
  get "/profile/edit" => "profiles#edit"
  put "/profile/update" => "profiles#update"
  patch "/profile/update" => "profiles#update"

  authenticated :user do
    root 'home#dashboard', as: :authenticated_root
  end

  root 'home#index'
end