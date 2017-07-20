Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  devise_scope :user do
    root to: 'devise/sessions#new'
  end


  scope :admins do
    root 'admins#index' , as: :admins_root
    patch '/:id/:admin' => 'admins#update', as: :set_admin

    get "pairs" => "admins#create_pairs"
    post "pairs" => "admins#save_pairs"
  end

  scope :students do
    root 'students#index' , as: :students_root
  end
end
