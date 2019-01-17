Rails.application.routes.draw do
  resources :members

  namespace :admin do
    resources :members
    root to: "members#index"
  end
end
