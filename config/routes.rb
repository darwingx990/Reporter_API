Rails.application.routes.draw do
  resources :reportes, only: [:create, :index, :update]
end
