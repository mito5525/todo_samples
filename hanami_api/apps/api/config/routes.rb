resources :users, only: [] do
  resources :tasks, only: %i[index create], controller: :tasks
end
resources :tasks, only: %i[show update destroy]
