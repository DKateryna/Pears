Rails.application.routes.draw do
  devise_for :users

  root 'pages#home'
  get '/admins' => 'admins#index', as: :admin_root
  get '/students' => 'students#index', as: :student_root

  namespace :admin do
    root 'admins#index'
  end

  namespace :student do
    root 'students#index'
  end
end
