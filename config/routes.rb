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
    resources :listings do
      patch :flag
    end
  end
  resources :users, except: [:delete]

  namespace :staff do


    root :to => "access#menu"

    resource :access, :controller => "access", :except => [:edit, :update] do
      member do
        get :get_password_idea
        get :menu
        get :cms_menu
        get :don_data
        get :forgot_password
        patch :send_new_password
      end
    end

    resources :admins, :except => :show do
      member do
        get :delete
      end
    end

    resources :users, :except => :show do
      member do
        get :delete
      end
    end

    resources :events do
      member do
        get :delete
        get :merge
        patch :merge_events
      end

      resources :listings, :except => :show do
        member do
          get :delete
        end
      end
    end

  end
end
