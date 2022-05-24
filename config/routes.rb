Rails.application.routes.draw do

  resources :splash_screen, only: [:index]
  devise_for :users

  resources :categories, only: %i[index new create show] do
    resources :transacts, only: %i[index new create destroy]
  end

  root "splash_screen#index"
end
