Rails.application.routes.draw do
  resources :payments
  root to: "admin/members#index"
  resources :members do
    collection { post :import }
  end

  namespace :admin do
    resources :members
    root to: "members#index"
  end
end
