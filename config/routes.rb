Rails.application.routes.draw do
  resources :wedding_albums
  resources :photo_contents, only: [:create]
  root 'basic_pages#index'
  get 'basic_pages/index'
  get 'basic_pages/about'
  get 'basic_pages/faq'
  get 'basic_pages/contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
