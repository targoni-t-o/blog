Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  mount Ckeditor::Engine, at: '/ckeditor'
  mount API, at: '/'

  devise_for :users,
             controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users, only: [:update] do
    collection do
      get :me
    end
  end

  resources :articles do
    resources :comments
    resources :likes, only: [], defaults: { format: 'json' } do
      collection do
        put :like
        put :unlike
      end
    end
  end

  root 'articles#index'
end
