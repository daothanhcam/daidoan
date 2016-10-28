Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations"
  }
  root 'posts#index'
  get 'static_pages/help'

  resources :posts, only: [:index, :show] do
    resources :comments, only: [:create, :destroy]
  end
end
