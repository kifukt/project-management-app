Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  namespace :v1, defaults: { format: :json } do
    resources :groups
    resources :tables
    resource :sessions, only: [:create, :destroy]

    get '/tables/:table_id/lists', to: 'lists#index'
    post '/tables/:table_id/lists', to: 'lists#create'
    delete '/tables/:table_id/lists/:id', to: 'lists#destroy'

    get '/tables/:table_id/lists/:list_id/cards', to: 'cards#index'
    post '/tables/:table_id/lists/:list_id/cards', to: 'cards#create'
    delete '/tables/:table_id/lists/:list_id/cards/:id', to: 'cards#destroy'

    get '/tables/:table_id/lists/:list_id/cards/:card_id/comments', to: 'comments#index'
    post '/tables/:table_id/lists/:list_id/cards/:card_id/comments', to: 'comments#create'
    delete '/tables/:table_id/lists/:list_id/cards/:card_id/comments/:id', to: 'comments#destroy'

    get '/tables/:table_id/lists/:list_id/cards/:card_id/tasks_lists', to: 'tasks_lists#index'
    post '/tables/:table_id/lists/:list_id/cards/:card_id/tasks_lists', to: 'tasks_lists#create'
    delete '/tables/:table_id/lists/:list_id/cards/:card_id/tasks_lists/:id', to: 'tasks_lists#destroy'

    get '/tables/:table_id/lists/:list_id/cards/:card_id/tasks_lists/:tasks_list_id/tasks', to: 'tasks#index'
    post '/tables/:table_id/lists/:list_id/cards/:card_id/tasks_lists/:tasks_list_id/tasks', to: 'tasks#create'
    delete '/tables/:table_id/lists/:list_id/cards/:card_id/tasks_lists/:tasks_list_id/tasks/:id', to: 'tasks#destroy'

  end

end
