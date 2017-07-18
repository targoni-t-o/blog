Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  resources :users, only: [:update] do
    collection do
      get :me
    end
  end

  resources :articles do
    resources :comments
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
