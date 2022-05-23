Rails.application.routes.draw do
  devise_for :users

  resources :categories, only: %i[index new create destroy show] do
    resources :transacts, only: %i[new create destroy]
  end

  root "categories#index"
end
