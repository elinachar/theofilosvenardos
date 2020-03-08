Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}, :skip => [:registrations]
  resources :users

  as :user do
    get 'edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end

  resources "wedding-albums", :controller => :wedding_albums, :as => :wedding_albums
  resources "baptism-albums", :controller => :baptism_albums, :as => :baptism_albums
  resources "interior-albums", :controller => :interior_albums, :as => :interior_albums

  resources :faqs, path: 'frequently-asked-questions'
  resources :testimonials

  root 'basic_pages#index'
  get 'basic_pages/index'
  get 'about', to: 'basic_pages#about'
  get 'contact', to: 'basic_pages#contact'
  post 'thank-you', to: 'basic_pages#thank_you'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
