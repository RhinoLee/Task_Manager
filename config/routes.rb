Rails.application.routes.draw do
  resources :tasks do 
    collection do 
      get :filter
    end
  end

  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'
  delete 'logout', to: 'sessions#destroy'

  root 'tasks#index'

end
