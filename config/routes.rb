Rails.application.routes.draw do
  resources :tasks  

  resources :searches, only: [:index] do 
    collection do 
      get :search
    end
  end

  root 'tasks#index'

end
