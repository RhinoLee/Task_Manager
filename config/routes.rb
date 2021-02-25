Rails.application.routes.draw do
  resources :tasks do 
    collection do 
      get :filter
    end
  end

  resources :user

  root 'tasks#index'

end
