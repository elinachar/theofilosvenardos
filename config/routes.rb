Rails.application.routes.draw do
  resources :interior_designs
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}, controllers: { registrations: "user_registrations" }
  resources :users
  resources :wedding_albums
  root 'basic_pages#index'
  get 'basic_pages/index'
  get 'basic_pages/about'
  get 'basic_pages/faq'
  get 'basic_pages/contact'
  post 'basic_pages/thank_you'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
