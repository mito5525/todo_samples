Rails.application.routes.draw do
  constraints format: :json do
    resources :users, only: [] do
      resources :tasks, only: %i[index create show update destroy], shallow: true
    end
  end
end
