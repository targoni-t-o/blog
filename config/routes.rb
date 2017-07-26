Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  devise_for :users,
             controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users, only: [:update] do
    collection do
      get :me
    end
  end

  resources :articles do
    resources :comments
    resources :likes, only: [] do
      collection do
        put :like
        put :unlike
      end
    end
  end

  root 'articles#index'
end
