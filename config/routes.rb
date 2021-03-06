Rails.application.routes.draw do
  
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users
  resources :articles do
    resources :comments
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'articles#index'

  get "info_pages/about"
  get "info_pages/contact"
  post "info_pages/thank_you"

end
