Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :products do
  	get "add_image"
  	patch "upload_image" => "products#upload_image"
  end
  resource :images
  patch '/images/:id/new', to: 'images#new'
end
