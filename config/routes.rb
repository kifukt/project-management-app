Rails.application.routes.draw do
  devise_for :users

  namespace :v1, defaults: { format: :json } do
    resources :groups do
      member do
        post 'change_leader'
        post 'add_user_to_group'
        get 'show_group_users'
        delete 'remove_user_from_group'
      end
    end
    resources :tables do
      resources :lists do
        resources :cards do
          resources :comments
          resources :tasks_lists do
            resources :tasks
          end
        end
      end
    end
    resources :users, only: [:create]
    resource :sessions, only: [:create, :destroy]
  end

end
