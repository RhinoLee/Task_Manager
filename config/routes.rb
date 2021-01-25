Rails.application.routes.draw do
  resources :task, only: [:create, :update, :destroy]

  resources :task_lists, only: [:index, :create, :update, :destroy]

  root 'task_lists#index'

end
