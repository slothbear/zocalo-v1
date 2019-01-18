Rails.application.routes.draw do
  root to: "admin/members#index"
  resources :members

  namespace :admin do
    resources :members
    root to: "members#index"
  end
end
