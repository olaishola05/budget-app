Rails.application.routes.draw do

  authenticated :user do
    root 'categories#index', as: :authenticated_root
  end

  unauthenticated do
    root "splash_screen#index"
  end

  devise_for :users

  resources :categories, only: %i[index new create show] do
    resources :transacts, only: %i[index new create]
  end

end
