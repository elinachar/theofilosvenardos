Rails.application.routes.draw do
  resources :faqs
  resources :testimonials
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
  get 'about', to: 'basic_pages#about'
  get 'frequently_asked_questions', to: 'basic_pages#faq'
  get 'contact', to: 'basic_pages#contact'
  post 'thank_you', to: 'basic_pages#thank_you'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
