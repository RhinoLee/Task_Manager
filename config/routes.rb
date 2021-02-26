Rails.application.routes.draw do
  resources :tasks do 
    collection do 
      get :filter
    end
  end

  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'

  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'

  get 'password', to: 'password#edit', as: :edit_password
  patch 'password', to: 'password#update'

  delete 'logout', to: 'sessions#destroy'

  root 'tasks#index'

end
