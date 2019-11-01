Rails.application.routes.draw do
  #devise_for :users
  devise_for :users, :controllers => { registrations: "users/registrations", sessions: "users/sessions" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home_pages#index"
  resources :contacts
  resources :github_pages
  resources :tweets
  resources :blog_posts, only: [:index, :create, :new, :show]
  resources :blog_posts do
    resources :comments
  end
  resources :blog_posts do
    resources :likes
  end

end
