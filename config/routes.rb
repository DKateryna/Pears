Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  get '/admins' => 'admins#index', as: :admin_root
  get '/students' => 'students#index', as: :student_root

  patch 'update/:id/:admin' => 'admins#update', as: :set_admin

  scope :admin do
    root 'admins#index'
  end

  namespace :student do
    root 'students#index'
  end
end
