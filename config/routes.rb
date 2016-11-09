Rails.application.routes.draw do

  resources :notepads

  resources :karigars do
    resources :balance_enquiries
  end

  resources :materials

  resources :customers do
    member do
      resources :accounts, only: [:index, :new, :create]
    end
  end
  resources :accounts, only: [:show, :edit, :update, :destroy]

  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :products do
  	get "add_image"
  	patch "upload_image" => "products#upload_image"
  end
  resources :images
  # patch '/images/:id/new', to: 'images#new'
end
