Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}, :skip => [:registrations]
  resources :users

  as :user do
    get 'edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end

  resources :wedding_albums
  resources :baptism_albums
  resources :interior_albums

  root 'basic_pages#index'
  get 'basic_pages/index'
  get 'basic_pages/about'
  get 'basic_pages/faq'
  get 'basic_pages/contact'
  post 'basic_pages/thank_you'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
