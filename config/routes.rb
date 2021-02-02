Rails.application.routes.draw do
  resources :tasks

  namespace :api do 
    namespace :v1 do 
      post 'sort_endtime', to: 'utils#sort_end_time'
      post 'sort_create_time', to: 'utils#sort_create_time'
    end
  end

  root 'tasks#index'

end
