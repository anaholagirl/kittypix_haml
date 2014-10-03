Rails.application.routes.draw do

  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}

  resources :photos, only: [:index, :show]
  resources :users do
    resources :photos
  end
end
