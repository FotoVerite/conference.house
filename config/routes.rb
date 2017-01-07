Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'events#index'
  get "/signup" => "users#new"
  get "/login" => "access#new"
  delete "/logout" => "access#destroy"
  get "forgot_password" => "access#forgot_password", :as => 'forgot_password'
  patch "send_reset_password" => "access#send_reset_password", :as => 'send_reset_password'
  get "reset_password/:token" => "access#reset_password", :as => 'reset_password'
  patch "update_reset_password" => "access#update_reset_password", :as => 'update_reset_password'
  resource :access, :controller => "access"
  resources :conversations, only: [:index, :show, :new, :create] do
    member do
      post :reply
      post :archive
      post :trash
      post :untrash
    end
  end
  resources :events, except: [:delete, :show] do
    resources :listings
  end
  resources :users, except: [:delete]
end
