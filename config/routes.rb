Rails.application.routes.draw do
  resources :tasks do 
    collection do 
      get :filter
    end
  end

  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'

  root 'tasks#index'

end
