Rails.application.routes.draw do
  root to: "pages#home"

  resources :members do
    collection { post :import }
  end

  resources :payments do
    collection { post :import }
  end

  namespace :admin do
    resources :members
    resources :payments
    root to: "members#index"
  end
end
