Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    root to: "devise/sessions#new"
  end

  get '/admins' => 'admins#index', as: :admin_root
  get '/students' => 'students#index', as: :student_root

  resources :admin
  scope :admin do
    root 'admins#index'
    put 'set_admin/:id/:admin' => 'admins#set_admin', as: :set_admin
  end

  namespace :student do
    root 'students#index'
  end
end
