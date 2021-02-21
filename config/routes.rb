Rails.application.routes.draw do
  resources :tasks do 
    collection do 
      get :filter
    end
  end

  root 'tasks#index'

end
